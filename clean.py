import os
import re

# 1. Clean up duplicate _Log classes in all models
def remove_duplicates(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all class definitions
    class_pattern = r'class\s+([A-Za-z0-9_]+)\(Base\):'
    matches = list(re.finditer(class_pattern, content))
    
    seen_classes = set()
    to_delete_spans = []
    
    for i, match in enumerate(matches):
        cls_name = match.group(1)
        start_idx = match.start()
        
        # End index is either the start of the next class or end of file
        end_idx = matches[i+1].start() if i + 1 < len(matches) else len(content)
        
        if cls_name in seen_classes:
            to_delete_spans.append((start_idx, end_idx))
        else:
            seen_classes.add(cls_name)
            
    if to_delete_spans:
        new_content = ""
        last_idx = 0
        for start, end in to_delete_spans:
            new_content += content[last_idx:start]
            last_idx = end
        new_content += content[last_idx:]
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Cleaned {len(to_delete_spans)} duplicate classes in {filepath}")

models_dir = 'backend/models'
for f in os.listdir(models_dir):
    if f.endswith('.py') and f != '__init__.py':
        remove_duplicates(os.path.join(models_dir, f))

# 2. Remove PartyGrpMst, PartyMast, SubItmGrpMst, SubItmMast from models/masters.py
with open('backend/models/masters.py', 'r', encoding='utf-8') as f:
    masters_content = f.read()

classes_to_remove = ['PartyGrpMst', 'PartyMast', 'SubItmGrpMst', 'SubItmMast']
for cls in classes_to_remove:
    # Remove both the normal and the _Log classes
    for suffix in ['', '_Log']:
        target = cls + suffix
        pattern = r'class\s+' + target + r'\(Base\):.*?(?=class\s+[A-Za-z0-9_]+\(Base\):|\Z)'
        masters_content = re.sub(pattern, '', masters_content, flags=re.DOTALL)

with open('backend/models/masters.py', 'w', encoding='utf-8') as f:
    f.write(masters_content)
print("Removed pharmacy classes from models/masters.py")

# 3. Remove duplicate schemas from schemas/masters.py
with open('backend/schemas/masters.py', 'r', encoding='utf-8') as f:
    schemas_content = f.read()

for cls in classes_to_remove:
    pattern = r'# ' + cls + r'.*?(?=# [A-Za-z0-9_]+|\Z)'
    schemas_content = re.sub(pattern, '', schemas_content, flags=re.DOTALL)

with open('backend/schemas/masters.py', 'w', encoding='utf-8') as f:
    f.write(schemas_content)
print("Removed pharmacy schemas from schemas/masters.py")

