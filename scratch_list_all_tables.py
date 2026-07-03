import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"
conn = psycopg2.connect(db_url)
cursor = conn.cursor()

cursor.execute("""
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
""")
tables = [row[0] for row in cursor.fetchall()]
print("Tables in PostgreSQL DB:")
print(sorted(tables))
conn.close()
