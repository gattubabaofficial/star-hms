with open(r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital\HmsDStru.bas", "r", errors="ignore") as f:
    lines = f.readlines()

print("Searching for table creation or fields for PatCatgMst...")
for idx, line in enumerate(lines):
    if "PatCatgMst".lower() in line.lower() and ("create" in line.lower() or "table" in line.lower() or "addfield" in line.lower()):
        print(f"Line {idx+1}: {line.strip()}")
        # print surrounding 10 lines
        start = max(0, idx - 5)
        end = min(len(lines), idx + 20)
        print("--- CONTEXT ---")
        for j in range(start, end):
            print(f"{j+1}: {lines[j].strip()}")
        print("---------------\n")
