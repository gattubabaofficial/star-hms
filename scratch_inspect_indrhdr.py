import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"
conn = psycopg2.connect(db_url)
cursor = conn.cursor()

for table in ["IndrHdr", "IndrHdr_Log", "StsnMast"]:
    try:
        cursor.execute(f"""
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_schema = 'public' AND table_name = '{table}';
        """)
        cols = [f"{row[0]} ({row[1]})" for row in cursor.fetchall()]
        print(f"Table: {table}\nColumns: {cols}\n")
    except Exception as e:
        print(f"Error on {table}: {e}")
        
conn.close()
