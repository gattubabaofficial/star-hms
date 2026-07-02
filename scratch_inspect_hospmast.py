import pyodbc
import os

mdb_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospMast.Mdb"
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path

print(f"Connecting to: {os.path.basename(mdb_path)}")
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()
tables = [row.table_name for row in cursor.tables(tableType='TABLE')]

output_file = "scratch_hospmast_schema.txt"
with open(output_file, "w") as f:
    f.write(f"Schema of {os.path.basename(mdb_path)}\n")
    f.write("="*50 + "\n")
    for table in sorted(tables):
        if table.startswith("MSys"):
            continue
        try:
            cursor.execute(f"SELECT TOP 1 * FROM [{table}]")
            cols = [c[0] for c in cursor.description]
            f.write(f"Table: {table}\n")
            f.write(f"Columns: {', '.join(cols)}\n")
            f.write("-"*50 + "\n")
        except Exception as e:
            f.write(f"Table: {table} | Error reading columns: {e}\n")
            f.write("-"*50 + "\n")

print(f"Done! Written schema to {output_file}")
conn.close()
