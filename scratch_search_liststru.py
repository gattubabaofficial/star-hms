import os

dir_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital"
search_term = "ipdreg"

for root, dirs, files in os.walk(dir_path):
    for file in files:
        if file.endswith((".frm", ".bas", ".cls")):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                if search_term.lower() in content.lower() and "list" in content.lower():
                    # Print lines containing references to list structure setup in IpdReg context
                    lines = content.splitlines()
                    for idx, line in enumerate(lines):
                        if any(term in line.lower() for term in ["liststru", "colalignment", "colwidth", "field_title", "field_name"]):
                            print(f"{file}:{idx+1}: {line.strip()}")
            except Exception as e:
                pass
