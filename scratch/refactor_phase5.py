import os
import re

files_to_fix = [
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\sales\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\purchases\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\items\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\pharmacy\parties\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\lab\billing\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\lab\finance\page.tsx",
    r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)\reports\page.tsx"
]

def clean_file(filepath):
    if not os.path.exists(filepath):
        return
        
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        
    original = content
    
    # Remove #1a1a1a dark backgrounds
    content = content.replace("background: '#1a1a1a',", "")
    content = content.replace("background: '#1a1a1a'", "")
    
    # Remove neon #3bc9db
    content = re.sub(r"border:\s*'1px solid #3bc9db[^']*',?", "", content)
    content = re.sub(r"background:\s*'#3bc9db10',?", "", content)
    content = content.replace("color: '#868e96',", "")
    content = content.replace("color: '#868e96'", "")
    
    # Convert header borders to var(--border-color)
    content = content.replace("borderBottom: '1px solid #333'", "borderBottom: '1px solid var(--border-color)'")
    
    # Ensure empty styles are removed
    content = re.sub(r'style=\{\{\s*\}\}', '', content)
    content = re.sub(r',\s*,', ',', content)
    content = re.sub(r'\{\{\s*,', '{{ ', content)
    content = re.sub(r',\s*\}\}', ' }}', content)
    
    # Wrap pharmacy cards
    content = re.sub(
        r'<div style=\{\{\s*padding:\s*\'24px\',\s*borderRadius:\s*\'20px\'\s*\}\}>',
        r'<div className="dashboard-card" style={{ padding: \'24px\' }}>',
        content
    )
    content = re.sub(
        r'<div style=\{\{\s*padding:\s*\'24px\',\s*borderRadius:\s*\'20px\',\s*\}\}>',
        r'<div className="dashboard-card" style={{ padding: \'24px\' }}>',
        content
    )

    if content != original:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Cleaned Phase 5: {filepath}")

for f in files_to_fix:
    clean_file(f)
