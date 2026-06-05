# Betrieb & Backup

## Resilienz
Die Docker Container (n8n, postgres) sind mit `restart: unless-stopped` konfiguriert und laufen nach einem System-Neustart automatisch an.

## Backup
Nutzen Sie das beiliegende Skript `scripts/backup_postgres.sh`. Ein regelmäßiger Cronjob wird empfohlen:
`0 2 * * * /pfad/zu/scripts/backup_postgres.sh`
