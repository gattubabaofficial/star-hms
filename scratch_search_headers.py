import os

dir_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy"
headers = ["Disch.Mode", "Occup.Days", "Claim-ID", "UHID", "Scheme", "Admit.Fee", "P.Count"]

for root, dirs, files in os.walk(dir_path):
    for file in files:
        if file.endswith((".frm", ".bas", ".cls", ".md")):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                found = [h for h in headers if h.lower() in content.lower()]
                if found:
                    print(f"File: {file} | Found headers: {found}")
            except Exception as e:
                pass
