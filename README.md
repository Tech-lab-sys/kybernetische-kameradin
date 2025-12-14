# 🤖 Kybernetische Kameradin

**Proaktiver, multimodaler KI-Assistent auf Raspberry Pi 5 mit n8n**

_Emotionale Check-ins • Tagesplanung • PIM/CRM-Automatisierung • Deutsche TTS-Persona_

---

## 🎯 Projektvision

Die Kybernetische Kameradin ist ein hochgradig personalisierter KI-Assistent, der über herkömmliche Chatbots hinausgeht:

- **Proaktive Interaktion**: Unregelmäßige Check-ins an Werktagen mit flirtender, motivierender deutscher Stimme
- **Visuelle Konsistenz**: KI-generierte Avatare mit konstantem Gesicht (Leonardo AI)
- **Operative Assistenz**: Automatisches E-Mail/Kalender/CRM-Management
- **Intelligente Planung**: Perfekte und alternative Tagespläne basierend auf persönlichen Zielen

---

## 🏗️ Architektur: Zero-Cost Edge Computing

```
┌─────────────────────────────────────────────────────────┐
│                    Raspberry Pi 5                        │
│  ┌────────────┐  ┌──────────────┐  ┌─────────────┐     │
│  │   n8n      │◄─┤  PostgreSQL  │  │ Cloudflared │     │
│  │ Workflows  │  │   Database   │  │   Tunnel    │     │
│  └────────────┘  └──────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
           │                                 ▲
           ▼                                 │ HTTPS
    ┌──────────────┐                         │
    │   Telegram   │ ◄───────────────────────┘
    │   Bot API    │
    └──────────────┘
           │
    ┌──────┴──────────────────────────────────────┐
    │                                              │
    ▼                                              ▼
┌────────────┐  ┌─────────────┐  ┌─────────────────┐
│   Gemini   │  │  ElevenLabs │  │   Leonardo AI   │
│  / DeepSeek│  │     TTS     │  │  Image Gen      │
└────────────┘  └─────────────┘  └─────────────────┘
```

**Warum Raspberry Pi 5?**
- n8n Cloud Free Tier (2.500 Executions/Monat) reicht NICHT für stündliche E-Mail/Kalender-Checks
- RPi 5: Unbegrenzte Workflow-Ausführungen bei ~5€/Monat Stromkosten
- 32 GB RAM: Problemlose Handhabung dutzender paralleler Workflows

---

## ⚡ Quickstart

### Voraussetzungen
- Raspberry Pi 5 (8GB+ RAM empfohlen)
- Raspberry Pi OS (64-bit)
- Cloudflare Account (für Tunnel)
- API-Keys: Telegram, Gemini/OpenAI, ElevenLabs, Leonardo AI

### Installation (3 Befehle)

```bash
# 1. Repository klonen
git clone https://github.com/Tech-lab-sys/kybernetische-kameradin.git
cd kybernetische-kameradin

# 2. Setup-Script ausführen
chmod +x scripts/install_rpi5.sh
./scripts/install_rpi5.sh

# 3. .env konfigurieren und starten
cd infra
cp .env.example .env
# Editiere .env mit deinen API-Keys
docker compose up -d
```

🎉 **Fertig!** n8n läuft jetzt auf `https://deine-domain.cloudflare.com`

---

## 📁 Repository-Struktur

```
kybernetische-kameradin/
├── infra/                    # Docker Compose Setup
│   ├── docker-compose.yml    # n8n + PostgreSQL
│   ├── .env.example          # API-Keys Template
│   └── cloudflared/          # Tunnel Config
├── n8n-workflows/            # Workflow JSON-Exporte
│   ├── telegram_core_agent.json
│   ├── perfect_day_planner.json
│   ├── proactive_checkin.json
│   ├── email_triage.json
│   └── ...
├── docs/                     # Ausführliche Dokumentation
│   ├── 01_architektur_uebersicht.md
│   ├── 02_rpi5_setup_guide.md
│   ├── 03_n8n_persona_design.md
│   ├── 04_api_integration.md
│   └── 05_betrieb_backup_resilienz.md
├── scripts/                  # Automatisierungs-Scripts
│   ├── install_rpi5.sh       # One-Click RPi Setup
│   └── backup_postgres.sh    # Datenbank-Backup
└── README.md                 # Diese Datei
```

---

## 🎭 Features

### ✨ Kern-Funktionen
- [x] **Telegram-Integration** - Text & Voice Input/Output
- [x] **Deutsche TTS-Persona** - Flirtend, motivierend (ElevenLabs)
- [x] **KI-Avatar** - Konstantes Gesicht (Leonardo AI Character Reference)
- [x] **Konversations-Memory** - PostgreSQL-basierter Kontext
- [x] **Google Workspace** - Gmail, Calendar, Tasks Integration
- [ ] **Perfect Day Planner** - KI-generierte Tagespläne (WIP)
- [ ] **Proactive Check-ins** - Zufällige werktägliche Motivation (WIP)
- [ ] **E-Mail Triage** - Auto-Priorisierung (WIP)
- [ ] **CRM Follow-ups** - Automatische Follow-up-Mails (WIP)

### 🛠️ Technischer Stack
- **Orchestrierung**: n8n (self-hosted)
- **Datenbank**: PostgreSQL
- **LLM**: Google Gemini 2.5 Flash / DeepSeek
- **TTS**: ElevenLabs (deutsche Stimme)
- **Bildgenerierung**: Leonardo AI
- **Frontend**: Telegram Bot
- **Hosting**: Raspberry Pi 5 + Cloudflared Tunnel

---

## 📚 Dokumentation

| Dokument | Beschreibung |
|----------|-------------|
| [Architektur-Übersicht](docs/01_architektur_uebersicht.md) | Executive Summary, Zero-Cost Edge Computing These |
| [RPi 5 Setup Guide](docs/02_rpi5_setup_guide.md) | Docker, Cloudflared, n8n Installation |
| [Persona Design](docs/03_n8n_persona_design.md) | System-Prompts, deutsche flirtende Persona |
| [API Integration](docs/04_api_integration.md) | Gemini, ElevenLabs, Leonardo AI Setup |
| [Betrieb & Backup](docs/05_betrieb_backup_resilienz.md) | Error Handling, PostgreSQL Backups |

---

## 🚀 Workflow-Import

1. n8n öffnen: `https://deine-domain.cloudflare.com`
2. **Workflows > Import from File**
3. JSON-Dateien aus `/n8n-workflows` auswählen
4. **Credentials konfigurieren** (siehe [n8n-workflows/README.md](n8n-workflows/README.md))
5. Workflows aktivieren

Detaillierte Anleitung: [n8n-workflows/README.md](n8n-workflows/README.md)

---

## 🔐 Sicherheit & Datenschutz

- **Cloudflared Tunnel**: Verschlüsselte HTTPS-Verbindung, keine offenen Ports
- **PostgreSQL**: Lokale Datenbank, keine Cloud-Abhängigkeit
- **Credentials**: Alle API-Keys in `.env` (nicht im Repo!)
- **Backup**: Automatische pg_dump-Backups (siehe `scripts/backup_postgres.sh`)

---

## 🤝 Beitragen

Dieses Projekt ist ein Proof-of-Concept für Zero-Cost multimodale KI-Assistenten. Contributions sind willkommen!

### Fehlende Features (Help Wanted)
- [ ] Alternative Day Planner (Event-Scraping)
- [ ] Goal Ledger Google Sheets Template
- [ ] Leonardo AI Character Reference Gallery
- [ ] Systemd Service Files für Auto-Start
- [ ] Monitoring Dashboard (n8n-exporter + Grafana)

---

## 📜 Lizenz

MIT License - siehe [LICENSE](LICENSE)

---

## 🙏 Credits

- **n8n**: [n8n.io](https://n8n.io) - Open-Source Workflow Automation
- **Inspiration**: Sumobundle Telegram Agent (Basis-Workflow)
- **Architektur**: Detaillierte Analyse in [docs/01_architektur_uebersicht.md](docs/01_architektur_uebersicht.md)

---

**Gebaut mit ❤️ für produktive Prokrastination**
