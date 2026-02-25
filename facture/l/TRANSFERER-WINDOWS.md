# 📦 Transférer Factura Flow vers Windows

## 🎯 Méthode rapide

### 1. Copier tout le dossier

Copie ce dossier complet vers ton PC Windows :
```
l/  →  C:\Users\TonNom\Desktop\factura-flow\
```

### 2. Sur Windows, double-clique sur :
```
build-windows.bat
```

### 3. Attends la fin du build

Quand tu vois **"BUILD SUCCESSFUL"**, ton `.exe` est prêt dans :
```
dist\Factura Flow.exe
```

---

## 📋 Fichiers importants à copier

| Fichier | Pourquoi |
|---------|----------|
| `main_windows.py` | Code Python pour Windows |
| `web/` | Interface utilisateur |
| `icons/` | Icônes (logo.png, icon.ico) |
| `requirements.txt` | Dépendances |
| `build-windows.bat` | Script de build automatique |
| `data/` | Tes factures existantes (optionnel) |

---

## 🚀 Build pas à pas (si le script ne marche pas)

### Étape 1 : Installer Python

1. Va sur https://www.python.org/downloads/
2. Télécharge Python 3.11 ou plus récent
3. **⚠️ Coche "Add Python to PATH"** pendant l'installation
4. Clique sur Install

### Étape 2 : Ouvrir CMD

```cmd
cd C:\Users\TonNom\Desktop\factura-flow
```

### Étape 3 : Créer l'environnement

```cmd
python -m venv env
```

### Étape 4 : Activer l'environnement

```cmd
call env\Scripts\activate
```

### Étape 5 : Installer les packages

```cmd
pip install -r requirements.txt
pip install pyinstaller
```

### Étape 6 : Compiler

```cmd
pyinstaller --name="Factura Flow" --windowed --onefile --icon=icons\icon.ico --add-data "web;web" main_windows.py
```

### Étape 7 : Tester

```cmd
dist\Factura Flow.exe
```

---

## 🛠️ Créer un installateur professionnel

### Avec Inno Setup (Gratuit)

1. **Télécharger** : https://jrsoftware.org/isdl.php
2. **Installer** Inno Setup
3. **Ouvrir** `factura-flow-setup.iss`
4. **Compiler** (Ctrl+F9)
5. **Résultat** : `installer-output\FacturaFlow-Setup-1.0.exe`

### Avantages de l'installateur :
- ✅ Icône dans le menu Démarrer
- ✅ Désinstallateur propre
- ✅ Raccourci bureau
- ✅ Professionnel

---

## 📊 Taille attendue

| Fichier | Taille |
|---------|--------|
| `Factura Flow.exe` | ~180 MB |
| `FacturaFlow-Setup.exe` | ~185 MB |

C'est normal car Python est inclus dans l'exe.

---

## ❓ Problèmes fréquents

### "Python n'est pas reconnu"

→ Réinstalle Python en cochant **"Add to PATH"**

### "Module webview introuvable"

```cmd
pip install pywebview
```

### "Le dossier web est introuvable"

Assure-toi que le dossier `web` est au même endroit que `main_windows.py`.

### L'antivirus bloque l'exe

→ Ajoute une exception ou signe l'application avec un certificat

---

## ✅ Checklist finale

- [ ] Python 3.8+ installé
- [ ] Tous les fichiers copiés
- [ ] build-windows.bat exécuté
- [ ] Factura Flow.exe testé
- [ ] Installateur créé (optionnel)
- [ ] Testé sur un autre PC Windows

---

**Prêt en 5 minutes !** ⏱️
