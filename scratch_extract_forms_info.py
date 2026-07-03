import os
import re

legacy_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital"
files = [
    "PatCgMst.frm", "DctCgMst.frm", "RefCgMst.frm", "DctRolMs.frm", "DoctMast.frm",
    "RefByMst.frm", "RefToMst.frm", "SrvGrpMs.frm", "ServMast.frm", "PatMast.frm",
    "DiagMast.frm", "FloorMst.frm", "FlorMast.frm", "WardMast.frm", "BedMast.frm",
    "PartyMst.frm", "PrtGrpMs.frm", "SubItGMs.frm", "SubItMst.frm"
]

output_file = "scratch_extracted_form_details.txt"
with open(output_file, "w") as out:
    for filename in files:
        filepath = os.path.join(legacy_dir, filename)
        if not os.path.exists(filepath):
            out.write(f"File not found: {filename}\n\n")
            continue
            
        out.write(f"=== File: {filename} ===\n")
        try:
            with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
                content = f.read()
                
            # Find Form heading/caption
            heading_match = re.search(r"lblFormHeading\s+Begin.*?Caption\s*=\s*\"(.*?)\"", content, re.DOTALL | re.IGNORECASE)
            form_caption = heading_match.group(1) if heading_match else "UNKNOWN"
            out.write(f"Form Heading: {form_caption}\n")
            
            # Find all controls
            controls = re.findall(r"Begin\s+(VB\.\w+|MSFlexGridLib\.\w+|MSDataGridLib\.\w+|MSComCtl2\.\w+)\s+(\w+)", content)
            out.write("Controls found:\n")
            for ctrl_type, ctrl_name in controls:
                if ctrl_type in ["VB.TextBox", "VB.ComboBox", "VB.CheckBox", "VB.OptionButton", "MSFlexGridLib.MSFlexGrid", "VB.CommandButton"]:
                    # Try to find Caption or Text for this control
                    pattern = rf"Begin\s+{re.escape(ctrl_type)}\s+{re.escape(ctrl_name)}.*?End"
                    ctrl_block = re.search(pattern, content, re.DOTALL)
                    caption = ""
                    if ctrl_block:
                        cap_match = re.search(r"Caption\s*=\s*\"(.*?)\"", ctrl_block.group(0))
                        if cap_match:
                            caption = f" (Caption: {cap_match.group(1)})"
                    out.write(f"  - {ctrl_name} : {ctrl_type}{caption}\n")
                    
            # Find grid column definition logic (AddFields)
            addfields = re.findall(r"clsListStru\.AddFields\s+mExpr:=\"(.*?)\"(?:,\s*mTitle:=\"(.*?)\")?", content, re.IGNORECASE)
            if addfields:
                out.write("Grid Columns (from AddFields):\n")
                for expr, title in addfields:
                    title_str = f" ({title})" if title else ""
                    out.write(f"  - {expr}{title_str}\n")
            else:
                out.write("Grid Columns: None/Not Found in form\n")
                
            # Find SQL statements
            sqls = re.findall(r"\"Select\s+.*?\s+from\s+(\w+)\s*.*?\s*\"", content, re.IGNORECASE)
            if sqls:
                out.write(f"SQL Select Tables: {list(set(sqls))}\n")
            else:
                out.write("SQL Select Tables: Not Found\n")
                
            # Find Save logic mapping
            out.write("Save mapping snippet:\n")
            save_lines = []
            lines = content.split('\n')
            for i, line in enumerate(lines):
                if "Data_SaveEvent" in line or "cmdSaveForm_Click" in line:
                    for j in range(max(0, i-5), min(len(lines), i+30)):
                        save_lines.append(f"  {j+1}: {lines[j].strip()}")
                    break
            out.write("\n".join(save_lines) + "\n")
            
        except Exception as e:
            out.write(f"Error parsing: {e}\n")
        out.write("\n" + "="*50 + "\n\n")

print(f"Extraction complete! Written to {output_file}")
