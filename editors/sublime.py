import json
import re
from util import format_args

scope = "source.lua"
completions = []

def add_completion(name, arguments):
    arguments_formatted = format_args(arguments)

    completions.append({
        "trigger": name,
        "contents": [
            "{0}({1})".format(name, arguments_formatted)
        ]
    })

def gen_file():
    final_data = {
        "scope": scope,
        "completions": completions
    }

    pre_format_json = json.dumps(final_data, indent=4)
    formatted_json = perform_formatting(pre_format_json)

    return formatted_json

def perform_formatting(json):
    completions_regex = re.compile(r'\"completions\":\s+\[')
    trigger_regex = re.compile(r'{\s+\"trigger\":\s\"(.+)\",\s+\"contents\":.+\s+\"(.+)\"\s+.+\s+}')

    completion_sub = '\n    "completions": \n    ['
    trigger_sub = '{ "trigger": "\g<1>", "contents": "\g<2>" }'

    new_file = completions_regex.sub(completion_sub, json)
    new_file = trigger_regex.sub(trigger_sub, new_file)

    return new_file