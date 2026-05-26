import pyodbc
import json
import time
import requests
import os
import datetime

CONFIG_FILE = 'config.json'
STATE_FILE = 'state.json'

def load_config():
    with open(CONFIG_FILE, 'r') as f:
        return json.load(f)

def load_state():
    if os.path.exists(STATE_FILE):
        with open(STATE_FILE, 'r') as f:
            return json.load(f)
    return {"last_sync_times": {}}

def save_state(state):
    with open(STATE_FILE, 'w') as f:
        json.dump(state, f, indent=2)

def get_db_connection(mdb_path):
    conn_str = (
        r'DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};'
        rf'DBQ={mdb_path};'
    )
    return pyodbc.connect(conn_str)

def get_table_pk(table_name):
    # Heuristic based on table name prefix
    prefixes = {
        'PatMast': 'Ptt',
        'DoctMast': 'Dct',
        'ServMast': 'Srv',
        'BedMast': 'Bdm',
        'OutdReg': 'Opg',
        'OutdHdr': 'Ohd',
        'OutdRcpt': 'Orc',
        'IndrHdr': 'Ihd',
        'LabHdr': 'Lhd'
    }
    prefix = prefixes.get(table_name)
    if prefix:
        return f"{prefix}Code"
    return "id"

def fetch_changed_records(conn, table, last_sync_time):
    cursor = conn.cursor()
    # In a real scenario, the MS Access tables need a Timestamp/Updated column.
    # Since legacy systems often don't have this, we would track delta by copying 
    # everything or using triggers. For this implementation, we assume we fetch all active rows
    # or rely on RecState.
    # 
    # To prevent transferring the whole DB, a real sync agent uses a snapshot cache locally.
    # Here we just fetch everything that has RecState = 1.
    # (If this was prod, we'd compare against local sqlite snapshot to find diffs)
    
    try:
        cursor.execute(f"SELECT * FROM {table} WHERE RecState = 1")
        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()
        
        records = []
        for row in rows:
            record_data = dict(zip(columns, row))
            pk_col = get_table_pk(table)
            record_id = record_data.get(pk_col, 0)
            
            records.append({
                "record_id": record_id,
                "operation": "UPDATE", # Upsert essentially
                "data": record_data
            })
            
        return records
    except Exception as e:
        print(f"Error reading {table}: {e}")
        return []

def push_to_cloud(config, table, records):
    if not records:
        return True
        
    url = f"{config['apiUrl']}/push"
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {config['apiKey']}"
    }
    
    payload = {
        "table_name": table,
        "records": records
    }
    
    # We must convert date/datetime objects to strings for JSON serialization
    def default_serializer(obj):
        if isinstance(obj, (datetime.date, datetime.datetime)):
            return obj.isoformat()
        raise TypeError(f"Type {type(obj)} not serializable")
        
    try:
        response = requests.post(url, data=json.dumps(payload, default=default_serializer), headers=headers)
        response.raise_for_status()
        print(f"Successfully pushed {len(records)} records for {table}.")
        return True
    except Exception as e:
        print(f"Failed to push records for {table}: {e}")
        return False

def sync_cycle():
    config = load_config()
    state = load_state()
    
    print(f"[{datetime.datetime.now()}] Starting sync cycle...")
    
    try:
        conn = get_db_connection(config['mdbPath'])
    except Exception as e:
        print(f"Failed to connect to MS Access database: {e}")
        return
        
    for table in config['tables']:
        last_time = state['last_sync_times'].get(table, "1900-01-01T00:00:00")
        records = fetch_changed_records(conn, table, last_time)
        
        if records:
            success = push_to_cloud(config, table, records)
            if success:
                state['last_sync_times'][table] = datetime.datetime.now().isoformat()
                
    save_state(state)
    conn.close()
    print(f"[{datetime.datetime.now()}] Sync cycle completed.")

if __name__ == "__main__":
    config = load_config()
    interval_seconds = config.get('syncIntervalMinutes', 15) * 60
    
    print(f"Sync Agent started. Interval: {config.get('syncIntervalMinutes', 15)} minutes.")
    
    while True:
        sync_cycle()
        time.sleep(interval_seconds)
