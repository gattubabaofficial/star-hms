import pyodbc
import os

dbs = [
    r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\Payroll.Mdb",
    r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\Stock.Mdb",
    r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\Accounts.Mdb"
]

output_file = "scratch_payroll_stock_schema.txt"
with open(output_file, "w") as f:
    for db_path in dbs:
        name = os.path.basename(db_path)
        f.write(f"\nSchema of {name}\n")
        f.write("="*50 + "\n")
        conn_str = r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + db_path
        try:
            conn = pyodbc.connect(conn_str)
            cursor = conn.cursor()
            tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
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
            conn.close()
        except Exception as e:
            f.write(f"Failed to connect: {e}\n")

print(f"Done! Written schema to {output_file}")
