import os
import pyodbc

legacy_dir = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy"
mdb_files = []
for root, dirs, files in os.walk(legacy_dir):
    for file in files:
        if file.lower().endswith(".mdb"):
            mdb_files.append(os.path.join(root, file))

print(f"Found {len(mdb_files)} MDB files")

for mdb_path in mdb_files:
    conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
        print(f"File: {os.path.basename(mdb_path)} | Tables: {tables}")
        conn.close()
    except Exception as e:
        print(f"Error connecting to {os.path.basename(mdb_path)}: {e}")
