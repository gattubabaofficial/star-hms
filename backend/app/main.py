import os
import sys

# Add the workspace root folder to sys.path so 'backend' package imports resolve correctly
current_dir = os.path.dirname(os.path.abspath(__file__)) # .../backend/app
backend_dir = os.path.dirname(current_dir)                # .../backend
root_dir = os.path.dirname(backend_dir)                  # .../

if root_dir not in sys.path:
    sys.path.insert(0, root_dir)

from backend.main import app
