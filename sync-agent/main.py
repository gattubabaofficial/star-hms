import schedule
import time
import json
import logging

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")

def load_config():
    with open("config.json", "r") as f:
        return json.load(f)

def read_access_db(config):
    # TODO: Implement pyodbc connection and delta tracking
    logging.info(f"Reading from MS Access DB at {config['mdbPath']}...")
    return []

def push_to_api(config, changes):
    # TODO: Implement requests.post to FastAPI backend
    logging.info(f"Pushing {len(changes)} changes to {config['apiUrl']}...")
    pass

def job():
    logging.info("Starting sync job...")
    try:
        config = load_config()
        # 1. Read changed records from local MS Access using pyodbc
        changes = read_access_db(config)
        # 2. Push to FastAPI backend
        push_to_api(config, changes)
        logging.info("Sync job completed.")
    except Exception as e:
        logging.error(f"Error during sync job: {e}")

def main():
    try:
        config = load_config()
    except FileNotFoundError:
        logging.error("config.json not found. Please create one.")
        return

    interval = config.get("syncIntervalMinutes", 15)
    logging.info(f"Sync agent started. Interval: {interval} minutes.")
    
    # Run once immediately
    job()
    
    # Schedule
    schedule.every(interval).minutes.do(job)
    
    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == "__main__":
    main()
