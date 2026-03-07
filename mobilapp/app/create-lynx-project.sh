#!/bin/bash

# Script de création de projet Lynx avec configuration validée
# Usage: create-lynx-project <nom-du-projet>

set -e

# Couleurs pour les messages
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Création de projet Lynx - Configuration validée    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Vérifier si le nom du projet est fourni
if [ -z "$1" ]; then
    echo -e "${YELLOW}Veuillez entrer le nom de votre projet :${NC}"
    read PROJECT_NAME
else
    PROJECT_NAME="$1"
fi

# Valider le nom du projet
if [[ ! "$PROJECT_NAME" =~ ^[a-z0-9_-]+$ ]]; then
    echo -e "${RED}Erreur: Le nom du projet ne peut contenir que des lettres minuscules, des chiffres, des tirets et des underscores.${NC}"
    exit 1
fi

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null; then
    echo -e "${RED}Erreur: Node.js n'est pas installé. Veuillez l'installer d'abord.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Node.js détecté: $(node --version)${NC}"

# Vérifier si npm est installé
if ! command -v npm &> /dev/null; then
    echo -e "${RED}Erreur: npm n'est pas installé.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ npm détecté: $(npm --version)${NC}"
echo ""

# Créer le répertoire du projet
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

if [ -d "$PROJECT_DIR" ]; then
    echo -e "${RED}Erreur: Le répertoire '$PROJECT_NAME' existe déjà.${NC}"
    exit 1
fi

echo -e "${BLUE}Création du projet: $PROJECT_NAME${NC}"
echo -e "${BLUE}Chemin: $PROJECT_DIR${NC}"
echo ""

mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Créer package.json
echo -e "${YELLOW}Création de package.json...${NC}"
cat > package.json << 'EOF'
{
  "name": "calendar",
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "build": "rspeedy build",
    "dev": "rspeedy dev",
    "preview": "rspeedy preview"
  },
  "dependencies": {
    "@lynx-js/react": "^0.105.1"
  },
  "devDependencies": {
    "@lynx-js/qrcode-rsbuild-plugin": "^0.4.6",
    "@lynx-js/react-rsbuild-plugin": "^0.12.9",
    "@lynx-js/rspeedy": "^0.12.0",
    "@rspack/core": "^1.7.7"
  },
  "engines": {
    "node": ">=18"
  },
  "overrides": {
    "@rsbuild/core": {
      "@rspack/core": "^1.7.7"
    }
  }
}
EOF

# Mettre à jour le nom du projet dans package.json
sed -i.bak "s/\"name\": \"calendar\"/\"name\": \"$PROJECT_NAME\"/" package.json
rm package.json.bak

# Créer lynx.config.js
echo -e "${YELLOW}Création de lynx.config.js...${NC}"
cat > lynx.config.js << 'EOF'
import { defineConfig } from '@lynx-js/rspeedy'
import { pluginQRCode } from '@lynx-js/qrcode-rsbuild-plugin'
import { pluginReactLynx } from '@lynx-js/react-rsbuild-plugin'

export default defineConfig({
  plugins: [
    pluginQRCode({
      schema(url) {
        return `${url}?fullscreen=true`
      },
    }),
    pluginReactLynx(),
  ],
})
EOF

# Créer la structure de dossiers
echo -e "${YELLOW}Création de la structure de dossiers...${NC}"
mkdir -p src/assets

# Créer index.js
cat > src/index.js << 'EOF'
import { root } from '@lynx-js/react'
import App from './App.jsx'

root.render(<App />)

if (import.meta.webpackHot) {
  import.meta.webpackHot.accept()
}
EOF

# Créer App.jsx
cat > src/App.jsx << 'EOF'
import { useState } from '@lynx-js/react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <view class="container">
      <text class="title">Bienvenue sur Lynx!</text>
      <text class="subtitle">Projet: $PROJECT_NAME</text>
      <view class="card">
        <text class="count-label">Compteur:</text>
        <text class="count-value">{count}</text>
        <view class="button" onClick={() => setCount(count + 1)}>
          <text class="button-text">Incrémenter</text>
        </view>
      </view>
    </view>
  )
}

export default App
EOF

# Créer App.css
cat > src/App.css << 'EOF'
.container {
  flex: 1;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background-color: #f5f5f5;
}

.logo {
  width: 100px;
  height: 100px;
  margin-bottom: 20px;
}

.title {
  font-size: 28px;
  font-weight: bold;
  color: #333;
  margin-bottom: 8px;
}

.subtitle {
  font-size: 16px;
  color: #666;
  margin-bottom: 30px;
}

.card {
  background-color: white;
  border-radius: 12px;
  padding: 24px;
  width: 280px;
  align-items: center;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.count-label {
  font-size: 16px;
  color: #666;
  margin-bottom: 8px;
}

.count-value {
  font-size: 48px;
  font-weight: bold;
  color: #007AFF;
  margin-bottom: 20px;
}

.button {
  background-color: #007AFF;
  border-radius: 8px;
  padding: 12px 24px;
}

.button-text {
  color: white;
  font-size: 16px;
  font-weight: 600;
}
EOF

# Créer .gitignore
cat > .gitignore << 'EOF'
node_modules/
dist/
*.local
.DS_Store
EOF

# Créer README.md
cat > README.md << EOF
# $PROJECT_NAME

Projet Lynx créé avec la configuration validée.

## Démarrage

\`\`\`bash
# Installer les dépendances
npm install

# Lancer le serveur de développement
npm run dev

# Build de production
npm run build

# Preview
npm run preview
\`\`\`

## Structure

\`\`\`
$PROJECT_NAME/
├── src/
│   ├── index.js
│   ├── App.jsx
│   ├── App.css
│   └── assets/
├── lynx.config.js
├── package.json
└── README.md
\`\`\`

## Test avec LynxExplorer

1. Lancez \`npm run dev\`
2. Scannez le QR code avec l'application LynxExplorer
3. Ou accédez à l'URL affichée dans le terminal
EOF

# Télécharger les assets par défaut
echo -e "${YELLOW}Téléchargement des assets...${NC}"

# Créer un placeholder pour le logo lynx (un simple carré bleu en base64)
# Pour un vrai projet, remplacez ces fichiers par vos propres assets
curl -s -o src/assets/lynx-logo.png "https://via.placeholder.com/200x200/007AFF/FFFFFF?text=Lynx" || true
curl -s -o src/assets/react-logo.png "https://via.placeholder.com/200x200/61DAFB/000000?text=React" || true
curl -s -o src/assets/arrow.png "https://via.placeholder.com/50x50/333333/FFFFFF?text=→" || true

echo ""
echo -e "${GREEN}✓ Structure du projet créée avec succès!${NC}"
echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}Installation des dépendances...${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo ""

# Installation des dépendances
npm install --legacy-peer-deps

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✓ Projet créé avec succès!                            ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Projet:${NC} $PROJECT_NAME"
echo -e "${BLUE}Chemin:${NC} $PROJECT_DIR"
echo ""
echo -e "${YELLOW}Pour démarrer le projet:${NC}"
echo -e "  ${GREEN}cd $PROJECT_NAME${NC}"
echo -e "  ${GREEN}npm run dev${NC}"
echo ""
echo -e "${YELLOW}Ensuite, scannez le QR code avec LynxExplorer!${NC}"
echo ""
