# FiveM Snippet Generator
Generates snippets/completions for FiveM and GTA V native functions by parsing them from the given Lua files (_scheduler.lua, natives\_server.lua, natives\_universal.lua_)

Currently supports the following editors:
- Sublime Text
- Visual Studio Code
- Atom
- Notepad++

See the [release topic on the FiveM forums](https://forum.fivem.net/t/release-fivem-natives-snippets-completions-for-sublime-text-vs-code-atom-notepad/43776) for downloads and more details.

## Script Usage
1. Install Python 3 and Git if you do not already have them.

2. Create a new directory for the project, and `cd` into it.

3. Install the required packages using `pip install -r requirements.txt`.

4. Create an input folder and put your `scheduler.lua`, `natives_server.lua`, and `natives_universal.lua` inside. They can be found in your `FiveM Application Data/citizen/scripting/lua` directory.

5. Run the script using `python generator.py`, optionally providing the 1st argument as the input folder and the 2nd argument as the output folder. If none are provided, it will use the default `input` and `output` folders in the current working directory.

## License
This project is licensed under the GNU General Public License V3, as viewable in the `LICENSE` file.