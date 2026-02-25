# Build Instructions for Facture Pro

## Quick Build

```bash
./build.sh
```

This will create `dist/Facture Pro.app`

## Manual Build

### 1. Install PyInstaller

```bash
source env/bin/activate
pip install pyinstaller
```

### 2. Build the Application

```bash
pyinstaller --name="Facture Pro" \
    --windowed \
    --onefile \
    --add-data "web:web" \
    --osx-bundle-identifier "com.facturepro.app" \
    --hidden-import=webview \
    --hidden-import=http.server \
    --hidden-import=socketserver \
    main.py
```

### 3. Test the Application

```bash
open dist/Facture\ Pro.app
```

### 4. Install

Drag `dist/Facture Pro.app` to your Applications folder.

## Create DMG Installer (Optional)

To create a professional installer:

```bash
# Install create-dmg
brew install create-dmg

# Create DMG
create-dmg \
  --volname "Facture Pro Installer" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --app-drop-link 400 200 \
  "dist/Facture Pro.dmg" \
  "dist/Facture Pro.app"
```

## Troubleshooting

### App won't open (macOS security)

Go to **System Preferences > Security & Privacy** and click "Open Anyway".

Or run:
```bash
xattr -cr "dist/Facture Pro.app"
```

### Missing web folder

Make sure the `web/` folder is in the same directory as `main.py` when building.

### Port already in use

The app uses port 8000-8009. Close any other apps using these ports.
