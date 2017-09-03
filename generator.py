"""
Converts a FiveM lua reference file to VSCode snippets for autocompletion.
"""
import re
import json
import vscode
import sys
import os

# Get the functions file name from the first argument
try:
    functions_file_name = sys.argv[1]
except IndexError:
    print("Please pass the function file name as an argument")
    sys.exit()

# Open the functions file
try:
    functions_file = open(functions_file_name, 'r')
except FileNotFoundError:
    print("The file {0} does not exist!".format(functions_file_name))
    sys.exit()

# Read the functions file into a string
print("Reading functions from {0}".format(functions_file_name))
functions_file_content = functions_file.read()

# Close the functions file after reading
functions_file.close()

# Regular expression matching for Lua function definitions
function_regex = re.compile(r'''
    function\s                   # function definition
    ((?:Global)|(?:Citizen))     # type of function
    \.(\w+)                      # name of function
    \(((?:\w+)(?:,\s*\w+)*)?\)   # function arguments
    ''', re.VERBOSE)
matches = function_regex.findall(functions_file_content)

list_functions = {}

# Adds each matched function to a dictionary
for function in matches:
    function_type = function[0]
    function_name = function[1]
    function_args = function[2].replace(" ", "").split(",")

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

    if function_type == "Citizen":
        vscode.add_snippet("Citizen." + function_name, function_args)

# Convert snippets dictionary to JSON format
snippets_json = json.dumps(vscode.snippets, indent=2)

# Open the output file and write the snippets to it
output_file_name = "output/vscode_output.json"
print("Writing snippets to {0}!".format(output_file_name))
output_file = open(output_file_name, 'w')
output_file.write(snippets_json)
output_file.close()
print("Done!")