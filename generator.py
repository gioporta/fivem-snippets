"""
FiveM Snippets by Giovanni Porta (github.com/gioporta)

Converts FiveM Lua reference files to snippets and completions for several code editors.
"""
import re
import sys
import os
import time
from editors import vscode, sublime, atom, notepadplus
from util import read_file, write_file, citizenify
import config

# Get input and output folder from configuration if arguments not passed
input_folder = sys.argv[1] if len(sys.argv) >= 2 else config.DEFAULT_INPUT_FOLDER
output_folder = sys.argv[2] if len(sys.argv) >= 3 else config.DEFAULT_OUTPUT_FOLDER

# Notes the start time of script so it can compare at end
start_time = time.time()
print("Starting snippet generator with input folder '{0}' and output folder '{1}'".format(input_folder, output_folder))

# Where the contents of each file will be stored
file_contents = {}

files_not_existing = []

# Loop over each file and store its content in the dictionary
for file_name in config.NATIVE_FILE_NAMES:
    input_file = os.path.join(input_folder, file_name)

    if os.path.isfile(input_file):
        file_contents[file_name] = read_file(input_file)
    else:
        files_not_existing.append(file_name)

# If any of the files do not exist, tell the user and exit the script
if len(files_not_existing) >= 1:
    print("The following input files do not exist:")
    for file in files_not_existing:
        print("\t{0}".format(file))
    print("Ensure that all the input files are in the input folder.")
    sys.exit()

# Regular expression matching for Lua function definitions
function_regex = re.compile(r'''
    ^(?:\t+)?                            # any tabs or spaces
    function\s                           # function definition
    ((?:Global)|(?:Citizen))?            # type of function
    \.?(\w+)                             # name of function
    \(((?:[\w|\.]+)(?:,\s*[\w|\.]+)*)?\) # function arguments
    ''', re.VERBOSE | re.MULTILINE)

# Where every function will be stored after being parsed
list_functions = {}

# Read the files and parse the functions in them
for file_name, file_content in file_contents.items():
    print("Reading functions from {0}".format(file_name,))
    matches = function_regex.findall(file_content)

    # Adds each matched function to a dictionary
    for function in matches:
        function_type = function[0]
        function_name = function[1]
        function_args = function[2].replace(" ", "").split(",")

        if not function_type:
            function_type = "Default"

        if function_name in list_functions:
            print("Function {0} already exists from {1}, it will not be replaced by {2}.".format(function_name, list_functions[function_name]["file"], file_name))
        else:
            list_functions[function_name] = {
                "type": function_type,
                "args": tuple(function_args),
                "file": file_name
            }

# Creates a snippet for each function in the dictionary
for function_name in list_functions:
    function_type = list_functions[function_name]["type"]
    function_args = list_functions[function_name]["args"]

    if function_type == "Global" or function_type == "Default" or function_name in config.CITIZEN_GLOBALS:
        vscode.add_snippet(function_name, function_args)
        atom.add_snippet(function_name, function_args)
        sublime.add_completion(function_name, function_args)
        notepadplus.add_snippet(function_name, function_args)

    if function_type == "Citizen":
        vscode.add_snippet(citizenify(function_name), function_args)
        atom.add_snippet(citizenify(function_name), function_args)
        sublime.add_completion(citizenify(function_name), function_args)
        notepadplus.add_snippet(citizenify(function_name), function_args)

# Write the completed snippets & completions to respective files
write_file("VS Code snippets", (output_folder, "Visual Studio Code", "lua.json"), vscode.gen_file(), False)
write_file("Atom snippets", (output_folder, "Atom", "snippets.cson"), atom.gen_file(), False)
write_file("Sublime Text completions", (output_folder, "Sublime Text", "fivem.sublime-completions"), sublime.gen_file(), False)
write_file("Notepad++ completions", (output_folder, "Notepad++", "lua.xml"), notepadplus.gen_file(), True)

# Get the script's execution time and print it
execution_time = time.time() - start_time
print("Completed script execution in {0:06.3f} seconds.".format(execution_time,))