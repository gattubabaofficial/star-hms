import os

legacy_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital"
keywords = ["repeat", "pymt", "token", "role", "active"]

for file in os.listdir(legacy_dir):
    if file.lower().endswith(('.bas', '.cls')):
        filepath = os.path.join(legacy_dir, file)
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                for kw in keywords:
                    if kw in content.lower():
                        # Find matching lines
                        lines = content.split('\n')
                        for idx, line in enumerate(lines):
                            if kw in line.lower():
                                print(f"File: {file}:{idx+1} | Match '{kw}': {line.strip()[:100]}")
        except Exception as e:
            pass
