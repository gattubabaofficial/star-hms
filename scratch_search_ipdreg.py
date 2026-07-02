with open(r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital\IpdReg.frm", "r", encoding="utf-8", errors="ignore") as f:
    lines = f.readlines()

print(f"Total lines: {len(lines)}")
for i, line in enumerate(lines):
    if "flex" in line.lower() or "grid" in line.lower() or "col" in line.lower() or "disch" in line.lower():
        if len(line.strip()) < 120:
            print(f"Line {i+1}: {line.strip()}")
