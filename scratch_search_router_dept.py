with open(r"c:\Users\Dell\OneDrive\Desktop\star-hms\backend\routers\masters.py", "r", errors="ignore") as f:
    lines = f.readlines()

for idx, line in enumerate(lines):
    if "department" in line.lower() or "dept" in line.lower():
        print(f"Line {idx+1}: {line.strip()}")
