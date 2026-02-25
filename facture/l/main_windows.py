#!/usr/bin/env python3
"""
Factura Flow - Invoice Generator for Windows
A desktop application for creating and managing invoices/quotes
"""

import json
import os
import sys
from datetime import datetime
from pathlib import Path
import threading
import http.server
import socketserver

# Try pywebview first, fallback to webbrowser
try:
    import webview
    USE_PYWEBVIEW = True
except ImportError:
    import webbrowser
    USE_PYWEBVIEW = False

# Initialize data directory
if getattr(sys, 'frozen', False):
    # Running as compiled executable
    BASE_DIR = Path(sys.executable).parent
    if sys.platform == 'win32':
        # Windows: Look for web folder next to exe
        WEB_DIR = BASE_DIR / "web"
        DATA_DIR = BASE_DIR / "data"
    else:
        WEB_DIR = BASE_DIR / "web"
        DATA_DIR = BASE_DIR / "data"
else:
    # Running as script
    BASE_DIR = Path(__file__).parent
    WEB_DIR = BASE_DIR / "web"
    DATA_DIR = BASE_DIR / "data"

DATA_DIR.mkdir(exist_ok=True)
PROJECTS_FILE = DATA_DIR / "projects.json"
COUNTERS_FILE = DATA_DIR / "counters.json"

# Global variables
web_server = None
PORT = 8000


def load_json(filepath, default=None):
    """Load JSON data from file"""
    if default is None:
        default = []
    try:
        if filepath.exists():
            with open(filepath, 'r', encoding='utf-8') as f:
                return json.load(f)
    except (json.JSONDecodeError, IOError):
        pass
    return default


def save_json(filepath, data):
    """Save JSON data to file"""
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


class API:
    """JavaScript API"""
    
    def get_projects(self):
        return load_json(PROJECTS_FILE, [])
    
    def save_projects(self, projects):
        save_json(PROJECTS_FILE, projects)
        return True
    
    def increment_reference(self):
        counters = load_json(COUNTERS_FILE, {})
        save_json(COUNTERS_FILE, counters)
        return True
    
    def get_counters(self):
        return load_json(COUNTERS_FILE, {})
    
    def save_counters(self, counters):
        save_json(COUNTERS_FILE, counters)
        return True


class CustomHandler(http.server.SimpleHTTPRequestHandler):
    """Custom HTTP handler that serves from web directory"""
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(WEB_DIR), **kwargs)
    
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate')
        super().end_headers()
    
    def log_message(self, format, *args):
        # Suppress request logging for cleaner output
        pass


def start_server():
    """Start the web server"""
    global web_server, PORT
    
    # Allow socket reuse
    socketserver.TCPServer.allow_reuse_address = True
    
    # Find available port
    for port in range(8000, 8010):
        try:
            web_server = socketserver.TCPServer(("", port), CustomHandler)
            PORT = port
            print(f"Server started on port {port}")
            web_server.serve_forever()
            break
        except OSError:
            continue


def run_app():
    """Run the application"""
    
    print("🚀 Starting Factura Flow...")
    
    # Start web server in background thread
    server_thread = threading.Thread(target=start_server, daemon=True)
    server_thread.start()
    
    # Wait for server to start
    import time
    time.sleep(0.5)
    
    if USE_PYWEBVIEW:
        # Create API instance for JavaScript
        api = API()
        
        # Create native window with pywebview
        window = webview.create_window(
            title='Factura Flow',
            url=f'http://localhost:{PORT}/index.html',
            js_api=api,
            width=1400,
            height=900,
            x=100,
            y=100,
            resizable=True,
            fullscreen=False,
            min_size=(800, 600)
        )
        
        # Start pywebview
        webview.start()
    else:
        # Fallback: Open in default browser
        print(f"Opening in browser at http://localhost:{PORT}/index.html")
        webbrowser.open(f'http://localhost:{PORT}/index.html')
        
        # Keep server running
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            print("\nShutting down...")
            if web_server:
                web_server.shutdown()


if __name__ == '__main__':
    run_app()
