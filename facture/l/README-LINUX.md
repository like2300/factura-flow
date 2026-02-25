# 🐧 Factura Flow - Linux Guide

## 📦 Installation sur Linux

### Option 1 : AppImage (Recommandé - Universel)

**Fonctionne sur :** Ubuntu, Debian, Fedora, Arch, Manjaro, etc.

```bash
# 1. Télécharger depuis les Releases GitHub
wget https://github.com/like2300/factura-flow/releases/latest/download/FacturaFlow-x86_64.AppImage

# 2. Rendre exécutable
chmod +x FacturaFlow-x86_64.AppImage

# 3. Lancer
./FacturaFlow-x86_64.AppImage
```

**Optionnel : Intégration au bureau**
```bash
# Copier dans le PATH
sudo cp FacturaFlow-x86_64.AppImage /usr/local/bin/factura-flow

# Créer un lanceur
cat > ~/.local/share/applications/factura-flow.desktop << EOF
[Desktop Entry]
Name=Factura Flow
Exec=/usr/local/bin/factura-flow
Icon=office
Type=Application
Categories=Office;Finance;
EOF
```

---

### Option 2 : Arch Linux (AUR)

**Avec yay :**
```bash
yay -S factura-flow
```

**Avec paru :**
```bash
paru -S factura-flow
```

**Manuellement :**
```bash
# Cloner le AUR
git clone https://aur.archlinux.org/factura-flow.git
cd factura-flow

# Build et install
makepkg -si
```

---

### Option 3 : Ubuntu/Debian

**Installer les dépendances :**
```bash
sudo apt update
sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  python3-pywebview \
  python3-pil \
  libgtk-3-dev \
  libwebkit2gtk-4.0-dev \
  libappindicator3-dev \
  librsvg2-dev
```

**Build depuis les sources :**
```bash
# Cloner le repo
git clone https://github.com/like2300/factura-flow.git
cd factura-flow

# Créer l'environnement
python3 -m venv venv
source venv/bin/activate

# Installer les dépendances
pip install -r requirements.txt
pip install pyinstaller

# Build
pyinstaller --name="FacturaFlow" \
  --windowed \
  --onefile \
  --icon=icons/icon.ico \
  --add-data "web:web" \
  main_windows.py

# Lancer
./dist/FacturaFlow
```

---

### Option 4 : Fedora/RHEL

**Installer les dépendances :**
```bash
sudo dnf install -y \
  python3 \
  python3-pip \
  python3-virtualenv \
  gtk3-devel \
  webkit2gtk3-devel \
  libappindicator-gtk3-devel \
  librsvg2-devel
```

**Build :**
```bash
git clone https://github.com/like2300/factura-flow.git
cd factura-flow
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt pyinstaller
pyinstaller --name="FacturaFlow" \
  --windowed \
  --onefile \
  --add-data "web:web" \
  main_windows.py
./dist/FacturaFlow
```

---

## 🔧 Dépannage Linux

### Erreur : "No module named 'webview'"

```bash
pip install pywebview
```

### Erreur : "libgtk-3.so.0 not found"

**Ubuntu/Debian :**
```bash
sudo apt install libgtk-3-0
```

**Fedora :**
```bash
sudo dnf install gtk3
```

### Erreur : "libwebkit2gtk-4.0.so.37 not found"

**Ubuntu/Debian :**
```bash
sudo apt install libwebkit2gtk-4.0-37
```

**Fedora :**
```bash
sudo dnf install webkit2gtk3
```

### L'application ne se lance pas (AppImage)

```bash
# Vérifier les permissions
chmod +x FacturaFlow-x86_64.AppImage

# Essayer avec fuse
sudo apt install fuse  # Ubuntu/Debian
sudo dnf install fuse  # Fedora

# Lancer avec debug
./FacturaFlow-x86_64.AppImage --appimage-extract-and-run
```

### Wayland issues

Si tu utilises Wayland (Ubuntu 22.04+, Fedora 34+) :

```bash
# Forcer XWayland
GDK_BACKEND=x11 ./FacturaFlow-x86_64.AppImage
```

---

## 📁 Structure des fichiers Linux

```
factura-flow/
├── main_windows.py      # Code principal
├── web/
│   └── index.html       # Interface
├── icons/
│   ├── icon.ico         # Icône
│   └── logo.png         # Logo
├── facturaflow.desktop  # Fichier bureau
├── PKGBUILD             # Arch Linux build
└── requirements.txt     # Dépendances Python
```

---

## 🎨 Intégration au bureau

### Créer un lanceur manuel

```bash
cat > ~/.local/share/applications/factura-flow.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Factura Flow
Comment=Invoice Generator Application
Exec=/chemin/vers/FacturaFlow-x86_64.AppImage
Icon=office
Terminal=false
Type=Application
Categories=Office;Finance;
Keywords=invoice;billing;finance;
EOF

chmod +x ~/.local/share/applications/factura-flow.desktop
```

### Ajouter l'icône

```bash
# Copier l'icône
cp icons/logo.png ~/.local/share/icons/factura-flow.png

# Mettre à jour le cache
gtk-update-icon-cache ~/.local/share/icons/
```

---

## 📊 Tailles des fichiers

| Format | Taille | Plateforme |
|--------|--------|------------|
| AppImage | ~180 MB | Universel Linux |
| AUR Package | ~200 MB | Arch Linux |
| Source | ~50 MB | Tous Linux |

---

## 🔗 Liens utiles

- **Releases** : https://github.com/like2300/factura-flow/releases
- **AUR** : https://aur.archlinux.org/packages/factura-flow
- **AppImage** : https://appimage.org/
- **PyWebView** : https://pywebview.flowrl.com/

---

**Factura Flow** - Compatible avec toutes les distributions Linux ! 🐧
