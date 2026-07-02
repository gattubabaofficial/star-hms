import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"
conn = psycopg2.connect(db_url)
cursor = conn.cursor()

for t in ["patients", "PatMast"]:
    try:
        cursor.execute(f'SELECT * FROM "{t}" LIMIT 1')
        row = cursor.fetchone()
        cursor.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{t}'")
        cols = [r[0] for r in cursor.fetchall()]
        print(f"Table: {t}\nColumns: {cols}\nSample: {row}\n")
    except Exception as e:
        print(f"Table: {t} | Error: {e}")
        
conn.close()
