snippets = {}

def add_snippet(name, arguments):
    arguments_formatted = ""

    for index, arg in enumerate(arguments):
        if arg != "":
            string_to_add = "${{{0}:{1}}}".format(index + 1, arg)

            if index != len(arguments) - 1:
                string_to_add += ", "

            arguments_formatted += string_to_add

    snippets[name] = {
        "prefix": name,
        "body": [
            "{0}({1})".format(name, arguments_formatted)
        ]
    }