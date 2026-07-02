import zipfile
import os

zip_paths = [
    r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital.zip",
    r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111.zip"
]

search_terms = ["tokengrpid", "token", "repeat", "pymt. mode", "payment mode", "user role/department", "account head"]

for zip_path in zip_paths:
    print(f"Searching zip: {os.path.basename(zip_path)} ...")
    try:
        with zipfile.ZipFile(zip_path, 'r') as z:
            for name in z.namelist():
                if name.lower().endswith(('.frm', '.bas', '.cls', '.txt', '.ini', '.prd', '.md', '.sql')):
                    try:
                        with z.open(name) as f:
                            content = f.read().decode('utf-8', errors='ignore')
                            for term in search_terms:
                                if term in content.lower():
                                    print(f"  Found '{term}' in {name}")
                    except Exception as e:
                        pass
    except Exception as e:
        print(f"Error reading zip {zip_path}: {e}")
