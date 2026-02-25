#!/bin/bash
# Build script for Facture Pro macOS application

echo "🔨 Building Facture Pro..."

# Activate virtual environment
source env/bin/activate

# Install dependencies
pip install -r requirements.txt

# Clean previous builds
rm -rf build dist __pycache__

# Build with PyInstaller (onedir mode for macOS compatibility)
pyinstaller --name="Factura Flow" \
    --windowed \
    --onedir \
    --icon=icons/icon.icns \
    --add-data "web:web" \
    --osx-bundle-identifier "com.facturaflow.app" \
    --hidden-import=webview \
    --hidden-import=http.server \
    --hidden-import=socketserver \
    main.py

# Check if build succeeded
if [ -d "dist/Factura Flow.app" ]; then
    echo "✅ Build successful!"
    echo "📦 Application created: dist/Factura Flow.app"
    echo ""
    echo "To test the application:"
    echo "  open dist/Factura\\ Flow.app"
    echo ""
    echo "To install:"
    echo "  1. Open Finder"
    echo "  2. Go to dist/ folder"
    echo "  3. Drag 'Factura Flow.app' to Applications"
    echo ""
    echo "To create DMG installer:"
    echo "  ./create-dmg.sh"
else
    echo "❌ Build failed!"
    exit 1
fi
