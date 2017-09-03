import json
from util import format_args

scope = "source.lua"
completions = []

def add_completion(name, arguments):
    arguments_formatted = format_args(arguments)

    completions.append({
        "trigger": name,
        "contents": [
            "{0}({1})$0".format(name, arguments_formatted)
        ]
    })

def gen_file():
    final_data = {
        "scope": scope,
        "completions": completions
    }

    return json.dumps(final_data, indent=4)