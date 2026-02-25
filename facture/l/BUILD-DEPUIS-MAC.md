# 🪟 Build Windows depuis macOS - 3 Méthodes

## 🎯 Méthode 1 : GitHub Actions (RECOMMANDÉ ⭐)

**Avantages :**
- ✅ Build automatique sur un vrai Windows
- ✅ Pas besoin d'installer quoi que ce soit
- ✅ Build à chaque commit/tag
- ✅ Téléchargement automatique

### Comment faire :

1. **Crée un repo GitHub** (ou utilise-en un existant)

2. **Push ton code :**
   ```bash
   cd /Users/omerlinks/Desktop/facture/l
   git init
   git add .
   git commit -m "Factura Flow initial"
   git branch -M main
   git remote add origin https://github.com/TON_USER/factura-flow.git
   git push -u origin main
   ```

3. **Push un tag pour build :**
   ```bash
   git tag v1.0
   git push origin v1.0
   ```

4. **Attendre le build** (5-10 minutes)

5. **Télécharger** depuis :
   - GitHub Actions > Build Windows EXE > Download artifact
   - Ou depuis les Releases (si tag pushé)

---

## 🎯 Méthode 2 : Machine Virtuelle Windows

**Avantages :**
- ✅ Build local
- ✅ Test immédiat sur Windows
- ✅ Contrôle total

### Comment faire :

1. **Installer VirtualBox** (gratuit) :
   ```bash
   brew install --cask virtualbox
   ```

2. **Télécharger Windows 10/11 ISO** :
   https://www.microsoft.com/software-download/windows10

3. **Créer une VM Windows** dans VirtualBox

4. **Dans la VM Windows :**
   - Installer Python 3.11
   - Copier le dossier `factura-flow`
   - Lancer `build-windows.bat`

---

## 🎯 Méthode 3 : Boot Camp (Mac Intel uniquement)

**Avantages :**
- ✅ Performance maximale
- ✅ Windows natif

### Comment faire :

1. **Ouvre Utilitaire Boot Camp** (dans Applications > Utilitaires)

2. **Suis l'assistant** pour installer Windows

3. **Au boot sur Windows :**
   - Installer Python 3.11
   - Lancer `build-windows.bat`

---

## 🎯 Méthode 4 : Wine (NON RECOMMANDÉ ❌)

**Problèmes :**
- ❌ Très complexe à configurer
- ❌ Bugs fréquents
- ❌ Python Windows dans Wine = instable
- ❌ Build souvent corrompu

Si tu veux essayer quand même :
```bash
# Installer Wine
brew install --cask wine-stable

# Installer Python Windows dans Wine
# (Télécharger depuis python.org et installer avec wine)

# Lancer le build
chmod +x build-windows-from-mac.sh
./build-windows-from-mac.sh
```

**Résultat :** Probablement un échec ❌

---

## 📊 Comparaison

| Méthode | Difficulté | Temps | Fiabilité |
|---------|------------|-------|-----------|
| GitHub Actions | ⭐ Facile | 10 min | ✅ 100% |
| VM VirtualBox | ⭐⭐ Moyen | 1 heure | ✅ 95% |
| Boot Camp | ⭐⭐ Moyen | 1 heure | ✅ 100% |
| Wine | ⭐⭐⭐⭐ Difficile | 2+ heures | ❌ 50% |

---

## ✅ Ma recommandation

**Utilise GitHub Actions !**

C'est :
- Gratuit pour les repos publics
- Rapide (10 minutes)
- Fiable (vrai Windows Server)
- Automatique (build à chaque push)

### Setup en 30 secondes :

```bash
# 1. Créer le repo sur GitHub.com
# 2. Push le code
cd /Users/omerlinks/Desktop/facture/l
git init
git add .
git commit -m "Factura Flow"
git remote add origin https://github.com/TON_USER/factura-flow.git
git push -u origin main

# 3. Push un tag
git tag v1.0
git push origin v1.0

# 4. Attendre et télécharger
# Va sur GitHub > Actions > Download
```

---

## 📥 Après le build

Une fois l'exe téléchargé :

1. **Teste avec Wine** (optionnel) :
   ```bash
   wine "/path/to/Factura Flow.exe"
   ```

2. **Copie sur PC Windows** :
   - Clé USB
   - Réseau
   - Cloud (Dropbox, Google Drive, etc.)

3. **Crée un installateur** (optionnel) :
   - Utilise Inno Setup sur une VM Windows
   - Ou utilise un service cloud comme AppVeyor

---

## 🔗 Liens utiles

- **GitHub Actions** : https://github.com/features/actions
- **VirtualBox** : https://www.virtualbox.org/
- **Boot Camp** : https://support.apple.com/boot-camp
- **Wine** : https://www.winehq.org/

---

**Factura Flow** - Build Windows depuis macOS 🚀
