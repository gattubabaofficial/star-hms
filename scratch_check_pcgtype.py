import pyodbc
mdb_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospMast.Mdb"
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()
cursor.execute("SELECT PcgCode, PcgName, PcgType FROM PatCatgMst")
rows = cursor.fetchall()
for r in rows:
    print(f"Code: {r[0]} | Name: {r[1]} | Type: {r[2]} ({type(r[2])})")
conn.close()
