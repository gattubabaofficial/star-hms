import os

legacy_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital"

for file in os.listdir(legacy_dir):
    if file.lower().endswith('.frm'):
        filepath = os.path.join(legacy_dir, file)
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                if "category name" in content.lower():
                    # Print form name and a snippet
                    print(f"Form: {file}")
                    lines = content.split('\n')
                    for i, line in enumerate(lines):
                        if "category name" in line.lower():
                            start = max(0, i-5)
                            end = min(len(lines), i+6)
                            print(f"  --- Snippet (lines {start}-{end}): ---")
                            for j in range(start, end):
                                print(f"  {j}: {lines[j]}")
        except Exception as e:
            pass
