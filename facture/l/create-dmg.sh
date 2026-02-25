#!/bin/bash
# Create DMG Installer for Facture Pro

echo "📦 Creating DMG Installer..."

# Clean previous builds
rm -rf dist/Factura\ Flow.dmg distribution/Factura\ Flow.dmg

# Create DMG with professional layout and custom icon
create-dmg \
  --volname "Factura Flow Installer" \
  --volicon "icons/icon.icns" \
  --window-pos 200 120 \
  --window-size 700 450 \
  --icon-size 100 \
  --app-drop-link 450 200 \
  --icon "Factura Flow.app" 200 200 \
  --hide-extension "Factura Flow.app" \
  dist/Factura\ Flow.dmg \
  dist/Factura\ Flow.app

# Check if DMG was created
if [ -f "dist/Factura Flow.dmg" ]; then
    # Copy to distribution folder
    mkdir -p distribution
    cp "dist/Factura Flow.dmg" "distribution/"
    
    # Copy icon to distribution
    cp "icons/icon.icns" "distribution/"
    
    echo "✅ DMG created successfully!"
    echo "📦 Location: dist/Factura Flow.dmg"
    echo "📦 Distribution: distribution/Factura Flow.dmg"
    echo ""
    echo "To install:"
    echo "  1. Open distribution/Factura Flow.dmg"
    echo "  2. Drag Factura Flow to Applications"
else
    echo "❌ DMG creation failed!"
    exit 1
fi
