import os
import pyodbc

mdb_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospTran.Mdb"
name = os.path.basename(mdb_path)

search_cols = ["token", "repeat", "pymt", "payment", "mode", "inactive", "department", "role"]

print(f"Connecting to: {name} ...")
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path
try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
    print(f"Tables count: {len(tables)}")
    for table in sorted(tables):
        try:
            cursor.execute(f"SELECT TOP 1 * FROM [{table}]")
            cols = [c[0] for c in cursor.description]
            for col in cols:
                col_lower = col.lower()
                for s in search_cols:
                    if s in col_lower:
                        print(f"Table: {table} | Column: {col}")
        except Exception as e:
            pass
    conn.close()
except Exception as e:
    print("Error:", e)
print("Done searching HospTran.Mdb")
