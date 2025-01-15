import sys
import os

# Path to the test project directory
project_path = "/home/dom/bruxpulse/mini_src"

if project_path not in sys.path:
    sys.path.insert(0, project_path)

# Import the Flask app
from app import app as application
