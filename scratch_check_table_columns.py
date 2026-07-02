import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"

conn = psycopg2.connect(db_url)
cursor = conn.cursor()

for table in ["PatCatgMst", "PatCatgMst_Log", "patient_categories"]:
    try:
        cursor.execute(f"""
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_schema = 'public' AND table_name = '{table}';
        """)
        cols = [f"{row[0]} ({row[1]})" for row in cursor.fetchall()]
        print(f"Table: {table} | Columns: {cols}")
    except Exception as e:
        print(f"Table: {table} | Error: {e}")
        
conn.close()
