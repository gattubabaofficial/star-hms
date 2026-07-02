import os

brain_dir = r"C:\Users\Dell\.gemini\antigravity-ide\brain\b812a6db-fb82-424c-924c-c8e2cf6d638c"

for root, dirs, files in os.walk(brain_dir):
    for file in files:
        filepath = os.path.join(root, file)
        size = os.path.getsize(filepath)
        relpath = os.path.relpath(filepath, brain_dir)
        print(f"File: {relpath} | Size: {size} bytes")
