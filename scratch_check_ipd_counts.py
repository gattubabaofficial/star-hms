import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"
conn = psycopg2.connect(db_url)
cursor = conn.cursor()

for t in ["IndrReg", "IndrHdr", "ipd_admissions"]:
    try:
        cursor.execute(f'SELECT COUNT(*) FROM "{t}"')
        cnt = cursor.fetchone()[0]
        print(f"Table: {t} | Rows count: {cnt}")
    except Exception as e:
        print(f"Table: {t} | Error: {e}")
        
conn.close()
