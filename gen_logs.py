import os
import re

def generate_log_classes(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all model classes
    class_pattern = r'class\s+([A-Za-z0-9_]+)\(Base\):((?:\n(?:[ \t]+.*)?)*)'
    matches = re.finditer(class_pattern, content)

    new_classes = []
    
    for match in matches:
        cls_name = match.group(1)
        if cls_name.endswith('_Log') or cls_name == 'UserMast': # Skip existing logs or specific tables if needed
            continue
            
        cls_body = match.group(2)
        
        # Check if it has a tablename
        if '__tablename__' not in cls_body:
            continue
            
        # Replace tablename
        log_body = re.sub(r'__tablename__\s*=\s*[\'"]([A-Za-z0-9_]+)[\'"]', r'__tablename__ = "\1_Log"', cls_body)
        
        # Remove unique constraints, primary keys (will replace), indexes, relationships
        lines = log_body.split('\n')
        new_lines = []
        has_primary = False
        
        for line in lines:
            if 'relationship(' in line or 'ForeignKey(' in line:
                # Remove relationships and foreign keys for the log table
                line = re.sub(r',\s*ForeignKey\([^)]+\)', '', line)
                if 'relationship(' in line:
                    continue
            
            if 'Column(' in line:
                # Remove primary_key=True, index=True, unique=True
                line = re.sub(r',\s*primary_key=True', '', line)
                line = re.sub(r',\s*unique=True', '', line)
                # Keep index=True for regular columns if we want, but better to remove to save space
                line = re.sub(r',\s*index=True', '', line)
                
            new_lines.append(line)
            
        log_body = '\n'.join(new_lines)
        
        # Add LogId, LogAction, LogDate
        indent = "    "
        log_class = f"\n\nclass {cls_name}_Log(Base):"
        log_class += log_body
        
        # Insert the log columns right after tablename
        log_class = re.sub(
            r'(__tablename__ = "[^"]+")', 
            r'\1\n' + indent + 'LogId = Column(Integer, primary_key=True, autoincrement=True)\n' + indent + 'LogAction = Column(String(10), nullable=False)\n' + indent + 'LogDate = Column(DateTime, default=func.now())', 
            log_class
        )
        
        new_classes.append(log_class)

    if new_classes:
        # Check if func is imported
        if 'from sqlalchemy.sql import func' not in content and 'from sqlalchemy import' in content:
            # We need to add DateTime and func
            pass
            
        with open(file_path, 'a', encoding='utf-8') as f:
            f.write("".join(new_classes))

models_dir = 'backend/models'
for filename in os.listdir(models_dir):
    if filename.endswith('.py') and filename != '__init__.py':
        generate_log_classes(os.path.join(models_dir, filename))
        print(f"Generated logs for {filename}")
