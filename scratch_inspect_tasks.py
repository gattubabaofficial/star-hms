import os

task_dir = r"C:\Users\Dell\.gemini\antigravity-ide\brain\b812a6db-fb82-424c-924c-c8e2cf6d638c\.system_generated\tasks"
files = [os.path.join(task_dir, f) for f in os.listdir(task_dir) if f.endswith('.log')]
files.sort(key=os.path.getmtime)

print("Latest task logs:")
for filepath in files[-5:]:
    name = os.path.basename(filepath)
    mtime = os.path.getmtime(filepath)
    size = os.path.getsize(filepath)
    print(f"File: {name} | Time: {mtime} | Size: {size} bytes")
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
            print("  Last 3 lines:")
            for line in lines[-3:]:
                print(f"    {line.strip()}")
    except Exception as e:
        print(f"  Error reading: {e}")
    print("-" * 40)
