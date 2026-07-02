import shutil
import pyodbc
import os

src = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospMast.Mdb"
dst = r"c:\Users\Dell\OneDrive\Desktop\star-hms\temp_HospMast_type.Mdb"

try:
    shutil.copy2(src, dst)
    conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + dst
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    cursor.execute("SELECT TOP 1 PcgType FROM PatCatgMst")
    print("Cursor description for PcgType:")
    for d in cursor.description:
        print(d)
        # Type details
    conn.close()
except Exception as e:
    print("Error:", e)
finally:
    if os.path.exists(dst):
        try:
            os.remove(dst)
        except:
            pass
