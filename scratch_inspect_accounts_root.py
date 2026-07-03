import pyodbc
import os

mdb_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Accounts.Mdb")
conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + mdb_path

print("Connecting to:", mdb_path)
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()
tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
print("Tables found:", len(tables))
for table in sorted(tables):
    if table.startswith("MSys"):
        continue
    print(f"\n=== Table: {table} ===")
    try:
        cursor.execute(f"SELECT TOP 1 * FROM [{table}]")
        cols = cursor.description
        for c in cols:
            print(f"  {c[0]:30s} type={c[1].__name__ if hasattr(c[1],'__name__') else c[1]} size={c[3]} nullable={c[6]}")
        cursor.execute(f"SELECT COUNT(*) FROM [{table}]")
        cnt = cursor.fetchone()[0]
        print(f"  row count: {cnt}")
    except Exception as e:
        print(f"  Error: {e}")
conn.close()
print("\nDone!")
