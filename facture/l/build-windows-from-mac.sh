#!/bin/bash
# Build Windows EXE from macOS using PyInstaller with Wine
# This requires Wine and a Windows Python installation

echo "=========================================="
echo "  Factura Flow - Windows Build (macOS)"
echo "=========================================="
echo ""

# Check if Wine is installed
if ! command -v wine &> /dev/null; then
    echo "❌ Wine is not installed!"
    echo ""
    echo "Install Wine with:"
    echo "  brew install --cask wine-stable"
    echo ""
    echo "Or use the alternative: Build on actual Windows"
    echo "See: TRANSFERER-WINDOWS.md"
    exit 1
fi

# Check if Windows Python is available
if [ ! -d "$HOME/.wine/drive_c/Python311" ]; then
    echo "❌ Windows Python not found!"
    echo ""
    echo "You need to install Python for Windows in Wine:"
    echo "  1. Download Python 3.11 from python.org"
    echo "  2. Install with: wine python-3.11.exe"
    echo ""
    exit 1
fi

# Set up Wine prefix
export WINEPREFIX="$HOME/.wine"
export WINEARCH=win64

# Activate Windows Python
WIN_PYTHON="$HOME/.wine/drive_c/Python311/python.exe"
WIN_PIP="$HOME/.wine/drive_c/Python311/Scripts/pip.exe"

echo "🔨 Building for Windows..."
echo ""

# Install dependencies
echo "Installing dependencies..."
wine "$WIN_PIP" install -q pyinstaller pywebview pillow

# Clean previous builds
rm -rf build dist "Factura Flow.spec"

# Build with PyInstaller
echo "Compiling Factura Flow.exe..."
wine "$WIN_PYTHON" -m PyInstaller --name="Factura Flow" \
    --windowed \
    --onefile \
    --icon=icons/icon.ico \
    --add-data "web;web" \
    --hidden-import=webview \
    --hidden-import=http.server \
    --hidden-import=socketserver \
    main_windows.py

# Check result
if [ -f "dist/Factura Flow.exe" ]; then
    echo ""
    echo "=========================================="
    echo "  ✅ BUILD SUCCESSFUL!"
    echo "=========================================="
    echo ""
    echo "📦 Application: dist/Factura Flow.exe"
    SIZE=$(ls -lh "dist/Factura Flow.exe" | awk '{print $5}')
    echo "📊 Size: $SIZE"
    echo ""
    echo "To test with Wine:"
    echo "  wine dist/Factura\\ Flow.exe"
    echo ""
    echo "To copy to Windows:"
    echo "  Copy dist/Factura Flow.exe to USB or network"
    echo ""
else
    echo ""
    echo "=========================================="
    echo "  ❌ BUILD FAILED!"
    echo "=========================================="
    echo ""
    echo "Check error messages above."
    exit 1
fi
