import urllib.request
import json

try:
    url = "http://127.0.0.1:8000/api/ipd/registrations"
    req = urllib.request.Request(url)
    with urllib.request.urlopen(req) as response:
        data = json.loads(response.read().decode('utf-8'))
        print("Admissions count:", len(data))
        if data:
            print("Keys in serialized admission object:")
            for key in sorted(data[0].keys()):
                print(f"  {key}: {data[0][key]}")
        else:
            print("No admission records found.")
except Exception as e:
    print("Error querying backend:", e)
