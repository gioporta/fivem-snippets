"""
Converts a FiveM lua reference file to VSCode snippets for autocompletion.
"""
import re

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

print(MATCHES)

for function in MATCHES:
    print("Function: " + function[1])

    if function[2]:
        print("Args: " + function[2])
        args = function[2].replace(" ", "").split(",")
        num = 0

        for arg in args:
            num += 1
            print("Argument #" + str(num) + ": " + arg)

    else:
        print("No arguments!")

    print("")

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

print(list_functions)