import os
import json

msg_dir = r"C:\Users\Dell\.gemini\antigravity-ide\brain\b812a6db-fb82-424c-924c-c8e2cf6d638c\.system_generated\messages"
files = [os.path.join(msg_dir, f) for f in os.listdir(msg_dir) if f.endswith('.json')]
files.sort(key=os.path.getmtime)

print(f"Total files: {len(files)}")
for filepath in files[-8:]:
    name = os.path.basename(filepath)
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            data = json.load(f)
            sender = data.get('sender')
            content = data.get('content', '')
            print(f"File: {name} | Sender: {sender} | Size: {len(content)}")
            print(content[:600])
            print("-" * 50)
    except Exception as e:
        print(f"Error reading {name}: {e}")
