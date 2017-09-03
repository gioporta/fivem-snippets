"""
Converts a FiveM lua reference file to VSCode snippets for autocompletion.
"""
import re
import json
import vscode

DATA = \
    '''
function Global.ThisIsAnExample(arg1, arg2)
    return nil
end

function Global.CreateNewExample(oneArg)
    return nil
end

function Global.CreateAnotherExample()
    return nil
end

function Citizen.CreateTheThread(function)
    return nil
end
'''

FUNCTION_REGEX = re.compile(r'''
    function\s                   # function definition
    ((?:Global)|(?:Citizen))     # type of function
    \.(\w+)                      # name of function
    \(((?:\w+)(?:,\s*\w+)*)?\)   # function arguments
    ''', re.VERBOSE)

MATCHES = FUNCTION_REGEX.findall(DATA)

list_functions = {}

for function in MATCHES:
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
