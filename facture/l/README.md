# 🧾 Factura Flow

**Factura Flow** est une application multi-plateforme pour créer et gérer des factures professionnelles de manière simple et élégante.

![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows%20%7C%20Linux-lightgrey)
![Python](https://img.shields.io/badge/python-3.8+-green)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

---

## 📥 Installation

### 🍎 macOS

**Option 1 : Utiliser l'installateur (Recommandé)**

1. Téléchargez `Factura Flow.dmg` depuis les Releases
2. Ouvrez le fichier DMG
3. Glissez **Factura Flow.app** dans **Applications**

**Option 2 : Build depuis les sources**

```bash
cd /path/to/factura-flow
./build.sh
```

### 🪟 Windows

**Option 1 : Exécutable direct**

1. Télécharge `Factura Flow.exe` depuis les Releases
2. Double-clique pour lancer

**Option 2 : Build depuis les sources**

```cmd
build-windows.bat
```

### 🐧 Linux

**Option 1 : AppImage (Universel)**

```bash
# Télécharger depuis les Releases
chmod +x FacturaFlow-x86_64.AppImage
./FacturaFlow-x86_64.AppImage
```

**Option 2 : Arch Linux (AUR)**

```bash
# Avec yay
yay -S factura-flow

# Avec paru
paru -S factura-flow
```

**Option 3 : Build depuis les sources**

```bash
# Ubuntu/Debian
sudo apt install python3-pip python3-venv libgtk-3-dev libwebkit2gtk-4.0-dev
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt pyinstaller
python main_windows.py
```

📖 **Guides complets** :
- [Windows](README-WINDOWS.md)
- [Linux](README-LINUX.md)
- [Build depuis macOS](BUILD-DEPUIS-MAC.md)

---

## 🚀 Lancer depuis les sources

```bash
# macOS / Linux
source env/bin/activate
python main.py

# Windows (PowerShell)
.\env\Scripts\Activate
python main_windows.py
```

---

## ✨ Fonctionnalités

- 📄 **Factures professionnelles** - Créez des factures élégantes et personnalisées
- 📝 **Devis & Acomptes** - Gérez tous types de documents commerciaux
- 🔢 **Références automatiques** - Numérotation automatique par année
- 💰 **TVA dynamique** - Calcul automatique (avec exonération auto-entrepreneur)
- 💾 **Sauvegarde locale** - Vos données restent sur votre ordinateur
- 🖨️ **Impression A4** - Optimisé pour impression papier
- 🪟 **Fenêtre redimensionnable** - Interface adaptative
- 🎨 **Logo personnalisé** - Ajoutez votre logo sur les factures
- 🌐 **Multi-plateforme** - macOS et Windows

---

## 📁 Structure du projet

```
factura-flow/
├── main.py              # Backend macOS (pywebview)
├── main_windows.py      # Backend Windows
├── web/
│   └── index.html       # Frontend (HTML/CSS/JS)
├── icons/
│   ├── logo.png         # Logo original
│   ├── icon.icns        # Icône macOS
│   └── icon.ico         # Icône Windows
├── distribution/        # Installateurs prêts
│   ├── Factura Flow.dmg
│   └── Factura Flow.exe (après build Windows)
├── data/                # Données (créé automatiquement)
│   ├── projects.json    # Factures sauvegardées
│   └── counters.json    # Compteurs de références
├── build.sh             # Script de build macOS
├── build-windows.bat    # Script de build Windows
├── create-dmg.sh        # Créateur de DMG macOS
├── factura-flow-setup.iss  # Script Inno Setup Windows
├── requirements.txt     # Dépendances Python
└── README.md
```

---

## 🛠️ Technologies

- **Backend** : Python 3 + pywebview
- **Frontend** : HTML5, CSS3, JavaScript (vanilla)
- **Moteur** : WebKit (macOS) / Edge WebView2 (Windows)
- **Styles** : CSS personnalisé avec variables
- **Icônes** : Font Awesome
- **Polices** : Inter, JetBrains Mono

---

## 📝 Build

### macOS

```bash
./build.sh && ./create-dmg.sh
```

### Windows

```cmd
build-windows.bat
```

Puis pour l'installateur :
- Ouvrir `factura-flow-setup.iss` avec Inno Setup
- Compiler (Ctrl+F9)

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [README-WINDOWS.md](README-WINDOWS.md) | Guide de build Windows |
| [TRANSFERER-WINDOWS.md](TRANSFERER-WINDOWS.md) | Transférer vers Windows |
| [BUILD.md](BUILD.md) | Build avancé macOS |

---

## 🔧 Dépannage

### macOS - L'application ne s'ouvre pas

```bash
# Option 1 : Préférences Système
#  > Préférences Système > Sécurité et confidentialité > "Ouvrir quand même"

# Option 2 : Terminal
xattr -cr "/Applications/Factura Flow.app"
```

### Windows - Python non reconnu

→ Réinstalle Python en cochant **"Add Python to PATH"**

### Port déjà utilisé

L'application utilise les ports 8000-8009. Fermez les autres apps ou redémarrez.

---

## 📄 Licence

MIT License - Voir LICENSE pour plus de détails.

---

**Factura Flow** © 2024 - Créé avec ❤️ pour les professionnels
Multi-plateforme : macOS & Windows
