# 📦 Factura Flow - Résumé des builds

## ✅ Ce qui est prêt

### 🍎 macOS
| Fichier | Emplacement | Status |
|---------|-------------|--------|
| Application native | `dist/Factura Flow.app` | ✅ Prêt |
| Installateur DMG | `distribution/Factura Flow.dmg` | ✅ Prêt |
| Icône avec bords arrondis | `icons/icon.icns` | ✅ Prêt |

### 🪟 Windows
| Fichier | Emplacement | Status |
|---------|-------------|--------|
| Script de build | `build-windows.bat` | ✅ Prêt |
| Code Python Windows | `main_windows.py` | ✅ Prêt |
| Icône Windows | `icons/icon.ico` | ✅ Prêt |
| Script Inno Setup | `factura-flow-setup.iss` | ✅ Prêt |
| GitHub Actions workflow | `.github/workflows/build.yml` | ✅ Prêt |

---

## 🚀 Build Windows DEPUIS TON MAC

### ⭐ Méthode RECOMMANDÉE : GitHub Actions

**Aucune installation nécessaire !** GitHub build pour toi sur un vrai Windows.

#### 1. Push ton code sur GitHub

```bash
cd /Users/omerlinks/Desktop/facture/l
git init
git add .
git commit -m "Factura Flow"
git remote add origin https://github.com/TON_USER/factura-flow.git
git push -u origin main
git tag v1.0
git push origin v1.0
```

#### 2. Attendre le build (5-10 min)

Va sur : `https://github.com/TON_USER/factura-flow/actions`

#### 3. Télécharger l'exe

Clique sur le build > Download artifact > `Factura-Flow-Windows`

📖 **Guide complet** : [BUILD-DEPUIS-MAC.md](BUILD-DEPUIS-MAC.md)

---

## 📋 Checklist

### macOS
- [x] Icône arrondie créée (`make_icon.py`)
- [x] Application buildée (`./build.sh`)
- [x] DMG créé (`./create-dmg.sh`)
- [x] Dossier distribution prêt

### Windows
- [x] Script `build-windows.bat` créé
- [x] Code `main_windows.py` créé
- [x] Icône Windows `.ico` créée
- [x] Script Inno Setup `.iss` créé
- [x] GitHub Actions workflow créé
- [x] Documentation créée
- [ ] Build à exécuter via GitHub Actions

---

## 🎯 Prochaines étapes

### Option 1 : GitHub Actions (Recommandé)

```bash
# Push vers GitHub
git init
git add .
git commit -m "Factura Flow"
git remote add origin https://github.com/TON_USER/factura-flow.git
git push -u origin main
git tag v1.0
git push origin v1.0

# Puis attendre et télécharger depuis GitHub Actions
```

### Option 2 : VM Windows

1. Installer VirtualBox : `brew install --cask virtualbox`
2. Créer VM Windows 10/11
3. Copier le dossier dans la VM
4. Lancer `build-windows.bat`

### Option 3 : Boot Camp (Mac Intel)

1. Utilitaire Boot Camp > Installer Windows
2. Boot sur Windows
3. Lancer `build-windows.bat`

---

## 📊 Tailles attendues

| Platform | Fichier | Taille |
|----------|---------|--------|
| macOS | `Factura Flow.app` | ~200 MB |
| macOS | `Factura Flow.dmg` | ~150 MB |
| Windows | `Factura Flow.exe` | ~180 MB |
| Windows | `FacturaFlow-Setup.exe` | ~185 MB |

---

## 🔗 Documentation complète

| Document | Description |
|----------|-------------|
| [BUILD-DEPUIS-MAC.md](BUILD-DEPUIS-MAC.md) | **3 méthodes pour build Windows depuis Mac** |
| [README-WINDOWS.md](README-WINDOWS.md) | Guide de build Windows (sur PC) |
| [TRANSFERER-WINDOWS.md](TRANSFERER-WINDOWS.md) | Transférer vers Windows |
| [BUILD.md](BUILD.md) | Build avancé macOS |

---

**Factura Flow** - Prêt pour macOS & Windows ! 🎉
