import shutil
import pyodbc
import os

src = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospMast.Mdb"
dst = r"c:\Users\Dell\OneDrive\Desktop\star-hms\temp_HospMast.Mdb"

print("Copying database file...")
shutil.copy2(src, dst)

conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + dst
print("Connecting to copied database...")
try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    cursor.execute("SELECT PcgCode, PcgName, PcgType FROM PatCatgMst")
    rows = cursor.fetchall()
    print("Rows found in PatCatgMst:")
    for r in rows:
        print(f"Code: {r[0]} | Name: {r[1]} | Type: {r[2]} ({type(r[2]) if r[2] is not None else 'NoneType'})")
    
    # Also print the datatype description of PcgType
    cursor.execute("SELECT TOP 1 PcgType FROM PatCatgMst")
    print("Column description:", cursor.description)
    conn.close()
except Exception as e:
    print("Error:", e)

# Clean up
if os.path.exists(dst):
    try:
        os.remove(dst)
        print("Cleaned up copy.")
    except Exception as e:
        print("Could not clean up copy:", e)
print("Done!")
