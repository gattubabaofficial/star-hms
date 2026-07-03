with open(r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital\HmsDStru.bas", "r", errors="ignore") as f:
    lines = f.readlines()

for idx, line in enumerate(lines):
    if "PatCatgMst".lower() in line.lower():
        print(f"Line {idx+1}: {line.strip()}")
        # print surrounding lines
        start = max(0, idx - 5)
        end = min(len(lines), idx + 15)
        print("--- CONTEXT ---")
        for j in range(start, end):
            print(f"{j+1}: {lines[j].strip()}")
        print("---------------\n")
