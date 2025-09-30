#!/bin/bash
# Script de backup y restore básico en PostgreSQL
# Autor: Paula Bolaños

DB_NAME="mi_base_postgres"
BACKUP_DIR="/home/usuario/backups"
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$(date +%Y%m%d).sql"

mkdir -p $BACKUP_DIR

echo "===== Inicio de Backup PostgreSQL ====="
pg_dump -U postgres -F c $DB_NAME > $BACKUP_FILE
echo "Backup PostgreSQL completado: $BACKUP_FILE"

# ===== Restore ejemplo =====
echo "Para restaurar:"
echo "pg_restore -U postgres -d <base_destino> $BACKUP_FILE"
echo "===== Fin del script ====="
