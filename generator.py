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

start_time = time.time()

file_names = ("scheduler.lua", "natives_server.lua", "natives_universal.lua")
file_contents = {}

for file_name in file_names:
    input_file = os.path.join(".", "input", file_name)
    try:
        file_contents[file_name] = read_file(input_file)
    except FileNotFoundError:
        print("The file {0} does not exist! Ensure that you have an input folder with all your FiveM native files.".format(input_file))
        sys.exit()

# Regular expression matching for Lua function definitions
function_regex = re.compile(r'''
    ^(?:\t+)?                            # any tabs or spaces
    function\s                           # function definition
    ((?:Global)|(?:Citizen))?            # type of function
    \.?(\w+)                             # name of function
    \(((?:[\w|\.]+)(?:,\s*[\w|\.]+)*)?\) # function arguments
    ''', re.VERBOSE | re.MULTILINE)

list_functions = {}
citizen_globals = ("Wait", "CreateThread", "SetTimeout")

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

    if function_type == "Global" or function_type == "Default" or function_name in citizen_globals:
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
write_file("VS Code snippets", ("output", "Visual Studio Code", "lua.json"), vscode.gen_file(), False)
write_file("Atom snippets", ("output", "Atom", "snippets.cson"), atom.gen_file(), False)
write_file("Sublime Text completions", ("output", "Sublime Text", "fivem.sublime-completions"), sublime.gen_file(), False)
write_file("Notepad++ completions", ("output", "Notepad++", "lua.xml"), notepadplus.gen_file(), True)

execution_time = time.time() - start_time
print("Completed script execution in {0:06.3f} seconds.".format(execution_time,))