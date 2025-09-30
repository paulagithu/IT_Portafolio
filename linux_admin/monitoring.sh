#!/bin/bash
# Script de monitoreo básico de Linux
# Mide uso de CPU, memoria y espacio en disco
# Autor: Paula Bolaños

echo "===== Monitoreo del servidor ====="
echo "Fecha y hora: $(date)"
echo ""

# Uso de CPU
echo ">>> Uso de CPU:"
top -b -n1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 + $4 "%"}'
echo ""

# Uso de memoria
echo ">>> Uso de Memoria:"
free -h
echo ""

# Uso de disco
echo ">>> Uso de Disco:"
df -h | grep -E '^/dev/'
echo ""

# Opcional: enviar alerta si el uso de CPU > 80% o memoria < 20% libre
CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_FREE=$(free | grep Mem | awk '{print $4/$2 * 100.0}')
if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
  echo "ALERTA: CPU > 80%!"
fi
if (( $(echo "$MEM_FREE < 20" | bc -l) )); then
  echo "ALERTA: Memoria libre < 20%!"
fi

echo "===== Fin del monitoreo ====="
