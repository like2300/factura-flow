# 🌍 Factura Flow - Multi-Platform Build

## ✅ Configuration GitHub Actions - PRÊTE !

Ton projet est maintenant configuré pour build automatiquement sur **4 plateformes** !

---

## 🎯 Plateformes supportées

| Platform | Format | Build Status |
|----------|--------|--------------|
| 🍎 **macOS** | `.dmg` | ✅ GitHub Actions |
| 🪟 **Windows** | `.exe` | ✅ GitHub Actions |
| 🐧 **Ubuntu** | `.AppImage` | ✅ GitHub Actions |
| 🐧 **Arch Linux** | `.AppImage` | ✅ GitHub Actions |

---

## 🚀 Comment ça marche

### 1. Push un tag de version

```bash
git tag v1.0
git push origin v1.0
```

### 2. GitHub Actions se déclenche

4 builds parallèles se lancent :
- **Windows** (windows-latest)
- **macOS** (macos-latest)
- **Ubuntu** (ubuntu-22.04)
- **Arch Linux** (archlinux container)

### 3. Téléchargement automatique

Après 10-15 minutes :

**Depuis Releases :**
- https://github.com/like2300/factura-flow/releases

**Depuis Actions :**
- https://github.com/like2300/factura-flow/actions

---

## 📦 Fichiers générés

### macOS
- `Factura Flow.dmg` - Installateur macOS

### Windows
- `Factura Flow.exe` - Application Windows

### Linux (Ubuntu & Arch)
- `FacturaFlow-x86_64.AppImage` - AppImage universel

### Arch Linux (AUR)
- `PKGBUILD` - Pour publier sur AUR

---

## 🎨 Workflow GitHub Actions

Le fichier `.github/workflows/build.yml` contient :

```yaml
✅ build-windows  → Windows 10/11 (64-bit)
✅ build-macos    → macOS 10.13+ (Intel & Apple Silicon)
✅ build-ubuntu   → Ubuntu 22.04 (AppImage)
✅ build-arch     → Arch Linux (AppImage)
✅ create-release → Release GitHub avec tous les assets
```

---

## 📊 Temps de build approximatifs

| Platform | Temps |
|----------|-------|
| Windows | 5-7 min |
| macOS | 5-7 min |
| Ubuntu | 7-10 min |
| Arch | 7-10 min |
| **Total** | **10-15 min** (parallèle) |

---

## 🔗 Liens importants

- **Repo** : https://github.com/like2300/factura-flow
- **Actions** : https://github.com/like2300/factura-flow/actions
- **Releases** : https://github.com/like2300/factura-flow/releases

---

## 📝 Prochaines étapes

### ✅ Déjà fait :
- [x] Code pushé sur GitHub
- [x] Tag v1.0 créé
- [x] GitHub Actions configuré
- [x] 4 plateformes supportées
- [x] Documentation complète

### 🎯 À faire :
- [ ] Attendre la fin du build (10-15 min)
- [ ] Vérifier les Releases
- [ ] Tester chaque plateforme
- [ ] Publier PKGBUILD sur AUR (optionnel)

---

## 🎉 Résumé

**Factura Flow** est maintenant une application **multi-plateforme** complète :

- ✅ macOS (DMG)
- ✅ Windows (EXE)
- ✅ Linux - Ubuntu (AppImage)
- ✅ Linux - Arch (AppImage + AUR)

**Build automatique** à chaque tag via GitHub Actions !

---

**Prochain build :** `git tag v1.1 && git push origin v1.1` 🚀
