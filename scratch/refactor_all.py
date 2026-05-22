import os
import re

base_dir = r"C:\Users\thehu\Desktop\hospital\star-hms\src\app\(dashboard)"

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    original = content

    # 1. Clean Buttons
    # Match <button type="submit" style={...}>
    content = re.sub(
        r'<button\s+type="submit"\s+style=\{\{[^}]+\}\}',
        r'<button type="submit" className="btn btn-primary"',
        content
    )
    # Match <button type="button" onClick={...} style={...}>
    content = re.sub(
        r'<button\s+type="button"\s+onClick=\{([^}]+)\}\s+style=\{\{[^}]+\}\}',
        r'<button type="button" onClick={\1} className="btn"',
        content
    )
    # Discharge/Cancel buttons with explicit hardcoded backgrounds
    content = re.sub(r"background:\s*'#e03131'", "", content)
    content = re.sub(r"background:\s*'#f03e3e'", "", content)
    content = re.sub(r"background:\s*'transparent'", "", content)
    
    # 2. Add form-control to inputs, selects, textareas if not present
    content = re.sub(
        r'<input(?![^>]*className=)([^>]+)>',
        r'<input className="form-control"\1>',
        content
    )
    content = re.sub(
        r'<select(?![^>]*className=)([^>]+)>',
        r'<select className="form-control"\1>',
        content
    )
    content = re.sub(
        r'<textarea(?![^>]*className=)([^>]+)>',
        r'<textarea className="form-control"\1>',
        content
    )

    # 3. Clean up messy styles left over from string replacements
    content = content.replace("color: '#0b1420',", "")
    content = content.replace("color: '#0b1420'", "")
    content = content.replace("color: '#adb5bd',", "")
    content = content.replace("color: '#adb5bd'", "")
    content = content.replace("color: '#fff',", "")
    content = content.replace("color: '#fff'", "")
    content = content.replace("border: 'none',", "")
    content = content.replace("border: 'none'", "")
    content = content.replace("cursor: 'pointer',", "")
    content = content.replace("cursor: 'pointer'", "")
    content = content.replace("fontWeight: 'bold',", "")
    content = content.replace("fontWeight: 'bold'", "")
    content = content.replace("padding: '12px 32px',", "")
    
    # Clean up empty styles
    content = re.sub(r'style=\{\{\s*\}\}', '', content)
    content = re.sub(r'style=\{\{\s*,\s*\}\}', '', content)
    content = re.sub(r',\s*,', ',', content)
    content = re.sub(r'\{\{\s*,', '{{ ', content)
    content = re.sub(r',\s*\}\}', ' }}', content)

    # 4. Wrap <div style={{ display: 'flex', flexDirection: 'column', gap: 20, padding: 20}}> 
    # to use dashboard-card if it's a structural wrapper
    content = re.sub(
        r'<div\s+style=\{\{\s*display:\s*\'flex\',\s*flexDirection:\s*\'column\',\s*gap:\s*20,\s*padding:\s*20\s*\}\}',
        r'<div className="dashboard-card"',
        content
    )

    if content != original:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Refactored: {filepath}")

for root, dirs, files in os.walk(base_dir):
    for f in files:
        if f.endswith('.tsx'):
            process_file(os.path.join(root, f))
