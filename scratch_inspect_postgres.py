import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"

try:
    conn = psycopg2.connect(db_url)
    cursor = conn.cursor()
    
    # Get all tables in public schema
    cursor.execute("""
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
    """)
    tables = [row[0] for row in cursor.fetchall()]
    print("Tables in PostgreSQL database:", len(tables))
    
    for table in sorted(tables):
        cursor.execute(f"""
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_schema = 'public' AND table_name = '{table}';
        """)
        cols = [f"{row[0]} ({row[1]})" for row in cursor.fetchall()]
        print(f"Table: {table} | Columns: {cols}")
        
    conn.close()
except Exception as e:
    print("Error:", e)
