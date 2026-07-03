import os
import json

msg_dir = r"C:\Users\Dell\.gemini\antigravity-ide\brain\b812a6db-fb82-424c-924c-c8e2cf6d638c\.system_generated\messages"
subagent_id = "04e9fb7b-e14b-4b13-a44d-5874c4314be1"

for file in os.listdir(msg_dir):
    if file.endswith('.json'):
        filepath = os.path.join(msg_dir, file)
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                data = json.load(f)
                content = data.get('content', '')
                if subagent_id in content or subagent_id in data.get('sender', '') or any(keyword in content.lower() for keyword in ["category name", "tokengrpid", "action buttons"]):
                    print(f"File: {file} | Sender: {data.get('sender')}")
                    print(content)
                    print("=" * 60)
        except Exception as e:
            pass
