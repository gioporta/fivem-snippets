import xml.etree.cElementTree as ET
import xml.dom.minidom as minidom

snippets = []

def add_snippet(name, arguments):   
    snippets.append({
        "name": name,
        "params": arguments
    })

def gen_file():
    root = ET.Element("NotepadPlus")
    env = ET.SubElement(root, "Environment", ignoreCase="yes", paramSeparator=",", terminal=";", additionalWordChar=".:")
    autocomplete = ET.SubElement(root, "AutoComplete", language="LUA")

    for keyword in snippets:
        func_keyword = ET.SubElement(autocomplete, "KeyWord", name=keyword["name"], func="yes")
        func_overload = ET.SubElement(func_keyword, "Overload", retVal="")

        if keyword["params"][0] != "":
            for param in keyword["params"]:
                ET.SubElement(func_overload, "Param", name=param)

    rough_result = ET.tostring(root, encoding="Windows-1252", method="xml")
    reparsed_result = minidom.parseString(rough_result)

    return reparsed_result.toprettyxml(indent="  ", encoding="Windows-1252")
