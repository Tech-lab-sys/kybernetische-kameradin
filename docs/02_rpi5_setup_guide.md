# Raspberry Pi 5 Setup Guide

## Systemanforderungen
- Raspberry Pi 5
- Minimum 4GB RAM, 8GB empfohlen
- Hochwertige SD-Karte oder USB-SSD

## Installation
1. OS aufspielen (Raspberry Pi OS 64-bit)
2. `scripts/install_rpi5.sh` ausführen
3. Umgebungsvariablen in `infra/.env` anpassen
4. Docker Container starten mit `docker compose up -d` in `infra/`
