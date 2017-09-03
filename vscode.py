import json
from util import format_args

snippets = {}

def add_snippet(name, arguments):
    arguments_formatted = format_args(arguments)

    snippets[name] = {
        "prefix": name,
        "body": [
            "{0}({1})".format(name, arguments_formatted)
        ]
    }

def gen_file():
    return json.dumps(snippets, indent=4)