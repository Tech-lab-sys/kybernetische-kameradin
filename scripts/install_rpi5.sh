#!/bin/bash

# ==============================================================================
# Kybernetische Kameradin - RPi 5 Setup Script
# ==============================================================================

set -e

echo "🚀 Starte Installation für Kybernetische Kameradin auf Raspberry Pi 5..."

# Update system
echo "📦 System updaten..."
sudo apt update && sudo apt upgrade -y

# Install Docker
if ! command -v docker &> /dev/null; then
    echo "🐳 Docker installieren..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    rm get-docker.sh
else
    echo "🐳 Docker ist bereits installiert."
fi

# Install Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "🐳 Docker Compose installieren..."
    sudo apt-get install -y docker-compose-plugin
else
    echo "🐳 Docker Compose ist bereits installiert."
fi

echo "✅ Installation abgeschlossen! Bitte melde dich ab und wieder an (oder führe 'newgrp docker' aus), um Docker ohne sudo verwenden zu können."
echo "➡️ Nächste Schritte:"
echo "1. Wechsle ins infra Verzeichnis: cd infra"
echo "2. Kopiere die .env Vorlage: cp .env.example .env"
echo "3. Bearbeite die .env Datei mit deinen Werten"
echo "4. Starte n8n: docker compose up -d"
