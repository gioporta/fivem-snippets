"""
Converts a FiveM lua reference file to VSCode snippets for autocompletion.
"""
import re
import json
import vscode
import sys
import os

# Get the file name from the first argument
try:
    file_name = sys.argv[1]
except IndexError:
    print("Please pass the file name as an argument")
    sys.exit()

# Open the given file
try:
    file_data = open(file_name, 'r')
except FileNotFoundError:
    print("The file {0} does not exist!".format(file_name))
    sys.exit()

# Read the file into a string
print("Reading functions from {0}".format(file_name))
file_content = file_data.read()

function_regex = re.compile(r'''
    function\s                   # function definition
    ((?:Global)|(?:Citizen))     # type of function
    \.(\w+)                      # name of function
    \(((?:\w+)(?:,\s*\w+)*)?\)   # function arguments
    ''', re.VERBOSE)
matches = function_regex.findall(file_content)

list_functions = {}

for function in matches:
    function_type = function[0]
    function_name = function[1]
    function_args = function[2].replace(" ", "").split(",")

    if function_name in list_functions:
        print("Function {0} already exists, it will not be replaced.")
    else:
        list_functions[function_name] = {
            "type": function_type,
            "args": tuple(function_args)
        }

for function_name in list_functions:
    function_type = list_functions[function_name]["type"]
    function_args = list_functions[function_name]["args"]

    vscode.add_snippet(function_name, function_args)

    if function_type == "Citizen":
        vscode.add_snippet("Citizen." + function_name, function_args)



print(json.dumps(vscode.snippets, indent=2))
print("Done!")
