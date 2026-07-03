import sqlite3

db_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\backend\star-hms.db"

try:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    # Get all tables
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = [row[0] for row in cursor.fetchall()]
    print("Tables in SQLite database:", len(tables))
    
    for table in sorted(tables):
        cursor.execute(f"PRAGMA table_info([{table}])")
        cols = [row[1] for row in cursor.fetchall()]
        print(f"Table: {table} | Columns: {cols}")
        
    conn.close()
except Exception as e:
    print("Error:", e)
