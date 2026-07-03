import psycopg2

db_url = "postgresql://postgres:admin%40123@localhost:5432/star-hms"

try:
    conn = psycopg2.connect(db_url)
    cursor = conn.cursor()
    
    # Check users table
    cursor.execute("SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'users');")
    if cursor.fetchone()[0]:
        cursor.execute("SELECT id, username, email, role, is_active FROM users;")
        rows = cursor.fetchall()
        print("Users in 'users' table:")
        for r in rows:
            print(f"ID: {r[0]}, Username: {r[1]}, Email: {r[2]}, Role: {r[3]}, Active: {r[4]}")
    else:
        print("Table 'users' does not exist.")
        
    # Check UserMast table
    cursor.execute("SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'UserMast');")
    if cursor.fetchone()[0]:
        cursor.execute('SELECT "UsrCode", "UsrName", "UsrRecState" FROM "UserMast";')
        rows = cursor.fetchall()
        print("\nUsers in 'UserMast' table:")
        for r in rows:
            print(f"UsrCode: {r[0]}, UsrName: {r[1]}, RecState: {r[2]}")
    else:
        print("Table 'UserMast' does not exist.")
        
    conn.close()
except Exception as e:
    print("Error:", e)
