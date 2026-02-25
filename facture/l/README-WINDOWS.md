# 🪟 Factura Flow - Build Windows Guide

## 📋 Pré-requis

### Sur Windows :

1. **Python 3.8+** - Télécharger depuis [python.org](https://www.python.org/downloads/)
2. **Git** (optionnel) - Pour cloner le projet

## 🚀 Build rapide (Windows)

### Étape 1 : Copier les fichiers sur Windows

Copie tout le dossier `factura-flow` sur ton PC Windows.

### Étape 2 : Lancer le build

Double-clique sur **`build-windows.bat`**

L'application va :
- Créer un environnement virtuel
- Installer les dépendances
- Compiler `Factura Flow.exe`

### Étape 3 : Résultat

Tu trouveras l'application dans :
```
dist\Factura Flow.exe
```

---

## 📦 Créer un installateur Windows (.exe)

### Option 1 : Inno Setup (Recommandé)

1. **Télécharger Inno Setup** : https://jrsoftware.org/isdl.php
2. **Installer** Inno Setup
3. **Ouvrir** `factura-flow-setup.iss` dans Inno Setup Compiler
4. **Build** > Compile (Ctrl+F9)

### Option 2 : NSIS

Utilise Nullsoft Scriptable Install System

---

## 🛠️ Build manuel (pas à pas)

### 1. Ouvrir PowerShell ou CMD

```cmd
cd C:\path\to\factura-flow
```

### 2. Créer l'environnement virtuel

```cmd
python -m venv env
env\Scripts\activate
```

### 3. Installer les dépendances

```cmd
pip install -r requirements.txt
pip install pyinstaller pillow
```

### 4. Compiler avec PyInstaller

```cmd
pyinstaller --name="Factura Flow" ^
    --windowed ^
    --onefile ^
    --icon=icons\icon.ico ^
    --add-data "web;web" ^
    --hidden-import=webview ^
    --hidden-import=http.server ^
    --hidden-import=socketserver ^
    main_windows.py
```

### 5. Tester

```cmd
dist\Factura Flow.exe
```

---

## 📁 Structure après build

```
factura-flow/
├── dist/
│   └── Factura Flow.exe    # Application Windows
├── build/                   # Fichiers temporaires (peut être supprimé)
├── env/                     # Environnement virtuel
├── icons/
│   ├── logo.png
│   ├── icon.icns           # macOS
│   └── icon.ico            # Windows
├── web/
│   └── index.html
├── data/                    # Créé au premier lancement
├── build-windows.bat        # Script de build
├── main_windows.py          # Code Python Windows
└── README-WINDOWS.md        # Ce fichier
```

---

## ⚠️ Problèmes courants

### "Python is not recognized"

Ajoute Python au PATH :
1. Panneau de configuration > Système > Paramètres avancés
2. Variables d'environnement > Path > Modifier
3. Ajouter : `C:\Users\TonNom\AppData\Local\Programs\Python\Python311\`

### "Module not found: webview"

```cmd
pip install pywebview
```

### L'application se ferme immédiatement

Vérifie que le dossier `web` existe à côté de l'exe.

---

## 📝 Notes importantes

### Fichiers requis pour l'exe

L'application a besoin du dossier `web/` pour fonctionner.

Après le build, PyInstaller inclut automatiquement le dossier `web` dans l'exe (grâce à `--onefile`).

### Port utilisé

L'application utilise les ports **8000-8009**.

Si un autre programme utilise ces ports, l'application peut ne pas démarrer.

### Antivirus

Certains antivirus peuvent signaler un faux positif.

Solution :
- Signer l'exe avec un certificat de code signing
- Ajouter une exception dans l'antivirus

---

## 🎨 Personnaliser l'icône

1. Remplace `icons/logo.png` par ton image (1024x1024)
2. Lance : `python make_icon_windows.py`
3. Rebuild : `build-windows.bat`

---

## 📊 Taille de l'exe

L'exe fait environ **150-200 MB** car il inclut :
- Python runtime
- pywebview
- Toutes les dépendances

C'est normal pour une application Python standalone.

---

## ✅ Checklist avant distribution

- [ ] Tester sur Windows 10/11 propre
- [ ] Vérifier que toutes les fonctionnalités marchent
- [ ] Créer un installateur (Inno Setup)
- [ ] Signer l'application (optionnel mais recommandé)
- [ ] Créer un fichier LICENSE
- [ ] Rédiger un manuel d'utilisation

---

**Factura Flow** © 2024 - Compatible Windows 10/11 (64-bit)
