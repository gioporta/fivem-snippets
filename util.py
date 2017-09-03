def format_args(arguments):
    formatted_args = ""
    
    for index, arg in enumerate(arguments):
        if arg != "":
            string_to_add = "${{{0}:{1}}}".format(index + 1, arg)

            if index != len(arguments) - 1:
                string_to_add += ", "

            formatted_args += string_to_add
    
    return formatted_args