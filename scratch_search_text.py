import os

search_terms = ["token", "repeat", "pymt", "account head", "role/department", "in-active"]
legacy_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy"

found_any = False
for root, dirs, files in os.walk(legacy_dir):
    for file in files:
        if file.lower().endswith(('.frm', '.bas', '.cls', '.txt', '.ini', '.prd', '.md', '.sql')):
            filepath = os.path.join(root, file)
            try:
                with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    for term in search_terms:
                        if term in content.lower():
                            print(f"Match: '{term}' in {os.path.relpath(filepath, legacy_dir)}")
                            found_any = True
            except Exception as e:
                pass

if not found_any:
    print("No matches found in any source files.")
