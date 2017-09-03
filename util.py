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
        print("Reading functions from {0}".format(file_name))

        functions_file = open(file_name, 'r')
        file_content = functions_file.read()

        return file_content
    finally:
        print("Function reading complete, closing file.")
        functions_file.close()

def write_file(pretty_name, file_name, content):
    try:
        print("Writing {0} to {1}!".format(pretty_name, file_name))
        output_file = open(file_name, 'w')
        output_file.write(content)
    finally:
        print("File writing complete, closing file.")
        output_file.close()