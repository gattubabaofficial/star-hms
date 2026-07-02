import os

legacy_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy"
frms = []
for root, dirs, files in os.walk(legacy_dir):
    for file in files:
        if file.lower().endswith('.frm'):
            frms.append(os.path.join(root, file))

print(f"Total .frm files found: {len(frms)}")
for path in sorted(frms):
    print(os.path.relpath(path, legacy_dir))
