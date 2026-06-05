#!/bin/bash

# ==============================================================================
# Kybernetische Kameradin - PostgreSQL Backup Script
# ==============================================================================

BACKUP_DIR="./backups"
DB_CONTAINER="kybernetische-kameradin-db"
DB_USER="n8n"
DB_NAME="n8n"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/n8n_backup_${DATE}.sql.gz"

mkdir -p "$BACKUP_DIR"

echo "📦 Erstelle Backup von Datenbank ${DB_NAME}..."

if docker exec "$DB_CONTAINER" pg_dump -U "$DB_USER" "$DB_NAME" | gzip > "$BACKUP_FILE"; then
    echo "✅ Backup erfolgreich erstellt: ${BACKUP_FILE}"

    # Behalte nur die letzten 7 Backups
    echo "🧹 Räume alte Backups auf..."
    ls -t "${BACKUP_DIR}"/n8n_backup_*.sql.gz | tail -n +8 | xargs -r rm --
    echo "✅ Alte Backups bereinigt."
else
    echo "❌ Fehler beim Erstellen des Backups!"
    exit 1
fi
