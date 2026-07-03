import pyodbc

mdb_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\Accounts.Mdb"
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path

try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM VTypMast")
    cols = [c[0] for c in cursor.description]
    print("Columns in VTypMast:", cols)
    row = cursor.fetchone()
    if row:
        print("First row:", row)
    conn.close()
except Exception as e:
    print("Error:", e)
