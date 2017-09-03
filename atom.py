import cson
import re
from util import format_args

scope = ".source.lua"
snippets = {}

def add_snippet(name, arguments):
    arguments_formatted = format_args(arguments)
    tab_stop_num = 1

    if arguments[0] != "":
        tab_stop_num = len(arguments) + 1

    snippets[name] = {
        "prefix": name,
        "body": "{0}({1})${2}".format(name, arguments_formatted, tab_stop_num)
    }

def gen_file():
    final_data = {
        scope: snippets
    }

    pre_format_cson = cson.dumps(final_data, indent=2)
    formatted_cson = perform_formatting(pre_format_cson)

    return formatted_cson

def perform_formatting(cson):
    keys_regex = re.compile(r'( +)(\w+):')
    keys_sub = "\g<1>'\g<2>':"
    return keys_regex.sub(keys_sub, cson)