import pyodbc
import os

mdb_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\Accounts.Mdb"
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path

print("Connecting to Accounts.Mdb...")
try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
    print("Tables found:", tables)
    for table in sorted(tables):
        if table.startswith("MSys"):
            continue
        try:
            cursor.execute(f"SELECT TOP 1 * FROM [{table}]")
            cols = [c[0] for c in cursor.description]
            print(f"Table: {table} | Columns: {cols}")
        except Exception as e:
            print(f"Table: {table} | Error: {e}")
    conn.close()
except Exception as e:
    print("Connection error:", e)
print("Done!")
