"""
Converts a FiveM lua reference file to VSCode snippets for autocompletion.
"""
import re
import json
import sys
import os
import vscode
import sublime
import atom
import time
from util import read_file, write_file

start_time = time.time()

# Get the functions file name from the first argument
try:
    functions_file_name = sys.argv[1]
except IndexError:
    print("Please pass the function file name as an argument")
    sys.exit()

# Read the functions file
try:
    functions_file_content = read_file(functions_file_name)
except FileNotFoundError:
    print("The file {0} does not exist!".format(functions_file_name))
    sys.exit()

# Regular expression matching for Lua function definitions
function_regex = re.compile(r'''
    ^(?:\t+)?                            # any tabs or spaces
    function\s                           # function definition
    ((?:Global)|(?:Citizen))?            # type of function
    \.?(\w+)                             # name of function
    \(((?:[\w|\.]+)(?:,\s*[\w|\.]+)*)?\) # function arguments
    ''', re.VERBOSE | re.MULTILINE)
matches = function_regex.findall(functions_file_content)

list_functions = {}

# Adds each matched function to a dictionary
for function in matches:
    function_type = function[0]
    function_name = function[1]
    function_args = function[2].replace(" ", "").split(",")

    if not function_type:
        function_type = "Default"

    if function_name in list_functions:
        print("Function {0} already exists, it will not be replaced.".format(function_name))
    else:
        list_functions[function_name] = {
            "type": function_type,
            "args": tuple(function_args)
        }

# Creates a snippet for each function in the dictionary
for function_name in list_functions:
    function_type = list_functions[function_name]["type"]
    function_args = list_functions[function_name]["args"]

    vscode.add_snippet(function_name, function_args)
    atom.add_snippet(function_name, function_args)
    sublime.add_completion(function_name, function_args)

    if function_type == "Citizen":
        vscode.add_snippet("Citizen." + function_name, function_args)
        sublime.add_completion("Citizen." + function_name, function_args)

# Write the completed snippets & completions to respective files
write_file("VS Code snippets", "output/vscode_output.json", vscode.gen_file())
write_file("Atom snippets", "output/atom_output.cson", atom.gen_file())
write_file("Sublime Text completions", "output/sublime_output.json", sublime.gen_file())

execution_time = time.time() - start_time
print("Completed script execution in {0:06.3f} seconds.".format(execution_time,))