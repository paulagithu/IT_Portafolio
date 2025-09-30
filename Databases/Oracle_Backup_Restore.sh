#!/bin/bash
# Script de backup y restore en Oracle usando RMAN
# Autor: Paula Bolaños

# ===== Backup completo =====
echo "===== Inicio de Backup Oracle ====="
rman target / <<EOF
RUN {
  BACKUP DATABASE PLUS ARCHIVELOG;
}
EOF
echo "Backup Oracle completado."

# ===== Restore ejemplo =====
echo "Para restaurar la base de datos:"
echo "rman target / <<EOF
RESTORE DATABASE;
RECOVER DATABASE;
EOF"
echo "===== Fin del script ====="
