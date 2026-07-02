import os

workspace_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms"
zips = []
for root, dirs, files in os.walk(workspace_dir):
    for file in files:
        if file.lower().endswith(('.zip', '.rar', '.7z', '.cab', '.tar', '.gz')):
            zips.append(os.path.join(root, file))

print(f"Total zip files found: {len(zips)}")
for path in sorted(zips):
    print(os.path.relpath(path, workspace_dir))
