import pyodbc

MDB_PATH = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospMast.Mdb"

conn_str = (
    r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};"
    f"DBQ={MDB_PATH};"
)

try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    
    # 1. Print all tables in HospMast.Mdb
    tables = [row.table_name for row in cursor.tables(tableType='TABLE')]
    print("Tables in HospMast.Mdb:")
    print(tables)
    
    # 2. Check PatCatgMst columns
    cursor.execute("SELECT * FROM PatCatgMst")
    cols = [c[0] for c in cursor.description]
    print("\nColumns in PatCatgMst:")
    print(cols)
    
    # 3. Print first row
    rows = cursor.fetchall()
    print("\nFirst row of PatCatgMst:")
    if rows:
        print(dict(zip(cols, rows[0])))
    else:
        print("No rows found")
        
    conn.close()
except Exception as e:
    print("Error:", e)
