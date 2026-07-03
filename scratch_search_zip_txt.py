import os

txt_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\scratch_zip_files.txt"

with open(txt_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

print(f"Total lines: {len(lines)}")
keywords = ["acnt", "pay", "dept", "desg", "emp", "patcg"]

found = {}
for line in lines:
    line_lower = line.lower()
    for kw in keywords:
        if kw in line_lower:
            found.setdefault(kw, []).append(line.strip())

for kw, matches in found.items():
    print(f"Keyword: '{kw}' | Matches count: {len(matches)}")
    print("  First 10 matches:")
    for m in matches[:10]:
        print(f"    {m}")
