import os

files_to_fix = [
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\sales\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\purchases\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\items\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\parties\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\lab\billing\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\lab\finance\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\reports\page.tsx"
]

for f in files_to_fix:
    if os.path.exists(f):
        with open(f, 'r', encoding='utf-8') as file:
            content = file.read()
            
        original = content
        
        content = content.replace("style={{ padding: \\'24px\\' }}", "style={{ padding: '24px' }}")
        
        # ensure buttons are standard
        content = content.replace("<button className=\"btn\"", "<button className=\"btn btn-primary\"")
        content = content.replace("<button className=\"btn btn-primary\" btn-primary\"", "<button className=\"btn btn-primary\"")
        
        if content != original:
            with open(f, 'w', encoding='utf-8') as file:
                file.write(content)
            print("Fixed", f)
