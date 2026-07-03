import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"
conn = psycopg2.connect(db_url)
cursor = conn.cursor()

tables = ["PartyGrpMst", "PartyMast", "SubItmGrpMst", "SubItmMast", "StsnMast", "AreaMast"]

for t in tables:
    try:
        cursor.execute(f'SELECT count(*) FROM "{t}";')
        cnt = cursor.fetchone()[0]
        cursor.execute(f"""
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_schema = 'public' AND table_name = '{t}';
        """)
        cols = [f"{row[0]} ({row[1]})" for row in cursor.fetchall()]
        print(f"Table: {t} | Rows: {cnt}\nColumns: {cols}\n")
    except Exception as e:
        print(f"Error for table {t}: {e}")

conn.close()
