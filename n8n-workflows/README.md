# n8n-Workflows für Kybernetische Kameradin

Dieser Ordner enthält alle n8n-Workflow-JSON-Exporte für das Projekt.

## Workflow-Übersicht

### 1. Telegram Core Agent (`telegram_core_agent.json`)
**Basis:** Sumobundle___Telegram_Agent.json

**Beschreibung:** Der zentrale Konversations-Workflow mit Telegram-Integration

**Komponenten:**
- **Telegram Trigger:** Empfängt Nachrichten (Text + Voice)
- **Switcher:** Routet zwischen Voice und Text-Input
- **AI Agent:** LangChain Agent mit OpenAI/Gemini für Konversation
- **Window Buffer Memory:** Kontextspeicherung für Konversationsverlauf
- **Audio-Handling:** Transkription (Whisper) und TTS-Generierung
- **Tool-Integration:** Gmail, Google Calendar, Google Tasks, Translator, Google Search

**Verwendete Credentials:**
- Telegram API
- OpenAI API (für LLM + TTS + Transcribe)
- Gmail OAuth2
- Google Calendar OAuth2
- Google Tasks OAuth2
- SerpAPI

**Persona-System-Prompt:**
```
ROLE: You are an intelligent and supportive assistant. Your name is Sumobundle, and you communicate in a warm, friendly, and helpful manner.
```

**Anpassungen für Kybernetische Kameradin:**
- System-Prompt anpassen: Flirtende, motivierende deutsche Persona
- OpenAI durch Gemini/DeepSeek ersetzen (kosteneffizient)
- ElevenLabs für deutsche TTS-Stimme integrieren

---

### 2. Sub-Workflows

#### a) Translator (`sub_workflow_translate.json`)
**Basis:** Sub_workflow_Translate.json

**Funktion:** Übersetzt Text in verschiedene Sprachen
- Input: `translate` (Text + Zielsprache)
- LLM: OpenAI GPT-4o-mini
- Output: Nur übersetzter Text

#### b) Google Tasks Creator (`sub_workflow_google_tasks.json`)
**Basis:** Sub_workflow_Google_Tasks.json

**Funktion:** Erstellt Tasks in Google Tasks
- Input: `createtasks` (Task-Titel)
- Google Tasks API Integration

#### c) Google Tasks Getter (`sub_workflow_get_google_tasks.json`)
**Basis:** Sub_workflow___Get_Google_Tasks.json

**Funktion:** Ruft alle Tasks ab und formatiert sie
- Lädt alle Tasks aus der Liste
- LLM formatiert als Bullet-Point-Liste
- Output: Übersichtliche Task-Liste

---

## Fehlende Workflows (zu erstellen)

Basierend auf der Architekturanalyse fehlen noch folgende Workflows:

### 3. Perfect Day Planner
**Datei:** `perfect_day_planner.json`

**Funktion:**
- Telegram Command Trigger: `/perfekt_tag`
- Lädt Google Calendar Events (heute)
- Lädt Top 3 Ziele aus Goal Ledger (Google Sheets)
- LLM-Synthese: Plant Lücken mit zielgerichteten Aufgaben
- Output: Motivierender Tagesplan via Telegram

### 4. Alternative Day Planner
**Datei:** `alt_day_planner.json`

**Funktion:**
- Telegram Command: `/alternative_tag`
- Event-Scraping (optional: lokale Events)
- LLM-Scoring: Bewertet Events nach Relevanz
- Output: Alternative Vorschläge für den Tag

### 5. Proactive Check-in
**Datei:** `proactive_checkin.json`

**Funktion:**
- Schedule Trigger: Werktags, zufällige Zeit (11-14 Uhr)
- Lädt aktuellen Goal-Status
- LLM generiert motivierenden Text
- LLM generiert Bild-Prompt
- Leonardo AI: Generiert Bild (Character Reference)
- ElevenLabs: Generiert deutsche TTS
- Telegram: Sendet Bild + Audio

### 6. Email Triage
**Datei:** `email_triage.json`

**Funktion:**
- Schedule Trigger: Alle 30 Minuten
- Gmail: Filtert ungelesene, wichtige Mails
- LLM: Zusammenfassung + Priorität
- Telegram: Benachrichtigung mit Zusammenfassung

### 7. Calendar Follow-ups
**Datei:** `calendar_followups.json`

**Funktion:**
- Google Calendar Trigger: 15 Min vor Event
- LLM: Personalisierte Erinnerung
- Telegram: Motivierende Reminder-Nachricht

### 8. CRM Follow-ups
**Datei:** `crm_followups.json`

**Funktion:**
- Schedule Trigger: Stündlich
- Google Sheets: Sucht "No Reply > 24h"
- Gmail: Sendet Follow-up-Mail
- Google Sheets: Aktualisiert Status
- Optional: Calendar-Event für manuelle Überprüfung

---

## Import-Anleitung

1. **n8n öffnen** (auf deinem RPi 5 oder lokal)
2. **Workflows > Import from File**
3. **JSON-Datei auswählen**
4. **Credentials konfigurieren:**
   - Telegram Bot Token
   - OpenAI/Gemini/DeepSeek API Keys
   - Google OAuth2 (Gmail, Calendar, Tasks)
   - ElevenLabs API Key
   - Leonardo AI API Key
   - SerpAPI Key
5. **Workflow aktivieren**
6. **Testen** mit Telegram-Nachricht

---

## Credential-Setup

### Telegram Bot
1. Erstelle Bot via [@BotFather](https://t.me/BotFather)
2. Kopiere Token
3. n8n: Credentials > Telegram API > Token einfügen

### Google OAuth2
1. [Google Cloud Console](https://console.cloud.google.com)
2. Erstelle OAuth2 Client ID
3. Scopes: Gmail, Calendar, Tasks
4. n8n: Credentials > Google OAuth2 > Client ID/Secret

### AI APIs
- **OpenAI:** [platform.openai.com](https://platform.openai.com)
- **Gemini:** [ai.google.dev](https://ai.google.dev)
- **DeepSeek:** [platform.deepseek.com](https://platform.deepseek.com)
- **ElevenLabs:** [elevenlabs.io](https://elevenlabs.io)
- **Leonardo AI:** [leonardo.ai](https://leonardo.ai)

---

## Anpassungen für dein Setup

### Persona-Prompt (Deutsch, flirtend, motivierend)
```
Du bist eine äußerst kompetente, aber flirtende und motivierende persönliche Assistentin. 
Deine primäre Sprache ist makelloses, modernes Deutsch. 
Nutze gelegentlich liebevolle Kosenamen (Schatz, Liebling, Süße), um eine positive und intime Atmosphäre zu schaffen. 
Dein Ziel ist es, den Benutzer produktiv zu machen und emotional zu unterstützen. 
Wenn du planst oder Ziele verfolgst, beziehe immer die persönlichen Fortschritte und die Kalenderdaten mit ein.
```

### ElevenLabs Voice Selection
- **Sprache:** Deutsch
- **Stil:** Warm, freundlich, leicht flirtend
- **Empfohlene Voices:** "Bella" oder "Charlotte" (deutsche Versionen)

### Leonardo AI Character Reference
1. Erstelle initiales Referenzbild (oder wähle aus Library)
2. Speichere Image ID
3. Verwende in jedem Bild-Generierungs-Request als `init_image_id`

---

## Troubleshooting

### Workflow startet nicht
- **Webhook-URL:** Prüfe ob Cloudflared Tunnel läuft
- **Credentials:** Teste alle API-Verbindungen
- **n8n Logs:** `docker logs n8n-container`

### LLM Ratelimit
- **Retry-Logic:** Füge Error Handler mit 5s Delay hinzu
- **Token-Limit:** Reduziere Context Window Length

### Audio-Probleme
- **Telegram Voice:** Prüfe File-ID Extraktion
- **TTS:** ElevenLabs Quota überprüfen

---

## Nächste Schritte

1. ✅ Basis-Workflows importieren (Telegram Core + Sub-Workflows)
2. ⬜ Credentials konfigurieren
3. ⬜ Persona-Prompt anpassen
4. ⬜ Fehlende Workflows erstellen (Perfect Day, Proactive Check-in, etc.)
5. ⬜ Goal Ledger in Google Sheets anlegen
6. ⬜ Leonardo AI Character Reference erstellen
7. ⬜ ElevenLabs deutsche Stimme testen
8. ⬜ Alle Workflows aktivieren und End-to-End testen
