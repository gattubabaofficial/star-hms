import os

search_terms = ["token", "repeat", "pymt. mode", "pymt_mode", "payment_mode", "payment mode", "role/department", "department/role"]
workspace_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms"

matches = []
for root, dirs, files in os.walk(workspace_dir):
    if "venv" in root or "node_modules" in root or ".git" in root or ".next" in root:
        continue
    for file in files:
        if file.lower().endswith(('.frm', '.bas', '.cls', '.tsx', '.ts', '.py', '.json', '.md', '.css')):
            filepath = os.path.join(root, file)
            try:
                with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                    for line_no, line in enumerate(f, 1):
                        for term in search_terms:
                            if term in line.lower():
                                matches.append(f"{os.path.relpath(filepath, workspace_dir)}:{line_no} | Match '{term}': {line.strip()}")
            except Exception as e:
                pass

with open(r"c:\Users\Dell\OneDrive\Desktop\star-hms\scratch_matches.txt", "w", encoding="utf-8") as out:
    for m in matches:
        out.write(m + "\n")
print(f"Done, wrote {len(matches)} matches to scratch_matches.txt")
