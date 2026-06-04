import os
import re

def wipe_logs(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Match class Name_Log(Base): and all its body until the next class or end of file
    pattern = r'class\s+[A-Za-z0-9_]+_Log\(Base\):.*?(?=class\s+[A-Za-z0-9_]+\(Base\):|\Z)'
    new_content = re.sub(pattern, '', content, flags=re.DOTALL)
    
    # Also clean up multiple empty lines
    new_content = re.sub(r'\n{3,}', '\n\n', new_content)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

models_dir = 'backend/models'
for filename in os.listdir(models_dir):
    if filename.endswith('.py') and filename != '__init__.py':
        wipe_logs(os.path.join(models_dir, filename))
        print(f"Wiped logs from {filename}")
