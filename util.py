"""
Various miscellaneous utilities for the FiveM snippets generator
"""
import os

def format_args(arguments):
    formatted_args = ""

    for index, arg in enumerate(arguments):
        if arg != "":
            string_to_add = "${{{0}:{1}}}".format(index + 1, arg)

            if index != len(arguments) - 1:
                string_to_add += ", "

            formatted_args += string_to_add

    return formatted_args

def read_file(file_name):
    try:
        print("Reading file {0}".format(file_name))

        functions_file = open(file_name, 'r', encoding="utf8")
        try:
            file_content = functions_file.read()
        finally:
            functions_file.close()

        return file_content
    except FileNotFoundError:
        raise

def write_file(pretty_name, file_name, content, binary):
    file_name_joined = os.path.join(*file_name)
    dir_name = os.path.dirname(file_name_joined)

    print("Writing {0} to {1}!".format(pretty_name, file_name_joined))

    if not os.path.exists(dir_name):
        os.makedirs(dir_name)

    if binary:
        output_file = open(file_name_joined, 'wb')
    else:
        output_file = open(file_name_joined, 'w')

    try:
        output_file.write(content)
    finally:
        output_file.close()

def citizenify(name):
    return "Citizen." + name
