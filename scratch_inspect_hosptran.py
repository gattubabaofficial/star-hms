import os
import pyodbc

mdb_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospTran.Mdb"
name = os.path.basename(mdb_path)

print(f"Connecting to: {name} ...")
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path
try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
    print(f"SUCCESS: {name} | Tables ({len(tables)})")
    
    # Check all tables columns for keywords
    search_cols = ["repeat", "pymt", "token", "department", "role"]
    for table in sorted(tables):
        try:
            cursor.execute(f"SELECT TOP 1 * FROM [{table}]")
            cols = [c[0] for c in cursor.description]
            matching_cols = [c for c in cols if any(s in c.lower() for s in search_cols)]
            if matching_cols or any(k in table.lower() for k in ["catg", "category"]):
                print(f"  Table: {table} | Columns: {cols}")
        except Exception as e:
            pass
            
    conn.close()
except Exception as e:
    print(f"FAILED: {name} | Error: {e}")
