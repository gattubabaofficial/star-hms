import os

workspace_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms"
frms = []
for root, dirs, files in os.walk(workspace_dir):
    for file in files:
        if file.lower().endswith(('.frm', '.vbp')):
            frms.append(os.path.join(root, file))

print(f"Total files found: {len(frms)}")
for path in sorted(frms):
    print(os.path.relpath(path, workspace_dir))
