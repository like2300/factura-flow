#!/usr/bin/env python3
"""
Facture Pro - Invoice Generator with pywebview
A desktop application for creating and managing invoices/quotes
"""

import json
import os
from datetime import datetime
from pathlib import Path
import webview
import http.server
import socketserver
import threading

# Initialize data directory
DATA_DIR = Path(__file__).parent / "data"
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
        super().__init__(*args, directory=str(Path(__file__).parent / 'web'), **kwargs)
    
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate')
        super().end_headers()


def start_server():
    """Start the web server"""
    global web_server, PORT
    
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
    """Run the application with native window"""
    
    # Start web server in background thread
    server_thread = threading.Thread(target=start_server, daemon=True)
    server_thread.start()
    
    # Wait for server to start
    import time
    time.sleep(0.3)
    
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
        y=50,
        resizable=True,
        fullscreen=False,
        min_size=(800, 600)
    )
    
    # Start pywebview
    webview.start()


if __name__ == '__main__':
    print("Starting Facture Pro...")
    print("Press Ctrl+C to exit")
    run_app()
