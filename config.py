"""
Configuration file containing global constants for the FiveM snippets generator
"""
# Input files names to retrieve natives from (in order of retrieval)
NATIVE_FILE_NAMES = ("scheduler.lua", "natives_server.lua", "natives_universal.lua")

# The Citizen functions that have global aliases
CITIZEN_GLOBALS = ("Wait", "CreateThread", "SetTimeout")

DEFAULT_INPUT_FOLDER = "input"

DEFAULT_OUTPUT_FOLDER = "output"
