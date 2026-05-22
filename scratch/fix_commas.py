import os
import re

base_dir = r"c:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)"

for root, dirs, files in os.walk(base_dir):
    for f in files:
        if f.endswith(".tsx"):
            filepath = os.path.join(root, f)
            with open(filepath, 'r', encoding='utf-8') as file:
                content = file.read()
            
            original_content = content
            
            # Remove isolated commas on a line
            content = re.sub(r"^\s*,\s*$", "", content, flags=re.MULTILINE)
            
            # Remove comma at start of style block
            content = re.sub(r"\{\{\s*,", "{{", content)
            
            # Remove comma at end of style block
            content = re.sub(r",\s*\}\}", "}}", content)
            
            # Remove consecutive commas
            content = re.sub(r",\s*,", ",", content)
            
            # specifically for style={{ , ... }}
            content = content.replace("{{ ,", "{{ ")
            
            if content != original_content:
                with open(filepath, 'w', encoding='utf-8') as file:
                    file.write(content)
                print(f"Fixed {filepath}")

print("Syntax Fix Complete")
