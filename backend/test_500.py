import requests
import time
import subprocess
import threading
import sys

def run_server():
    subprocess.run(["python", "-m", "uvicorn", "app.main:app", "--port", "8080"], cwd=r"c:\Users\thehu\Desktop\hospital\star-hms\backend", capture_output=True, text=True)

server_thread = threading.Thread(target=run_server, daemon=True)
server_thread.start()

# Wait for server to start
time.sleep(3)

print("Testing /api/auth/companies...")
try:
    res = requests.get("http://localhost:8080/api/auth/companies")
    print("Status:", res.status_code)
    print("Response:", res.text)
except Exception as e:
    print("Error:", e)

print("\nTesting /api/auth/login...")
try:
    res = requests.post("http://localhost:8080/api/auth/login", json={"username": "admin", "password": "password", "companyCode": 1})
    print("Status:", res.status_code)
    print("Response:", res.text)
except Exception as e:
    print("Error:", e)
