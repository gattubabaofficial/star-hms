import os

txt_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\scratch_zip_files.txt"

with open(txt_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

filenames = ["desgmast", "deptmast", "acnthead", "stsnmast", "lgrview", "empmast", "prodmast"]

for line in lines:
    line_lower = line.lower()
    for fn in filenames:
        if fn in line_lower:
            print(f"Match: {line.strip()}")
