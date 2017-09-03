import re
import cson
from util import format_args

scope = ".source.lua"
snippets = {}

def add_snippet(name, arguments):
    arguments_formatted = format_args(arguments)

    snippets[name] = {
        "prefix": name,
        "body": "{0}({1})".format(name, arguments_formatted)
    }

def gen_file():
    final_data = {
        scope: snippets
    }

    pre_format_cson = cson.dumps(final_data, indent=2)
    formatted_cson = perform_formatting(pre_format_cson)

    return formatted_cson

def perform_formatting(cson_text):
    keys_regex = re.compile(r'( +)(\w+):')
    keys_sub = r"\g<1>'\g<2>':"
    return keys_regex.sub(keys_sub, cson_text)
