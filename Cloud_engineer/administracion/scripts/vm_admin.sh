#!/bin/bash
#
## =========================================================
## Script: vm_admin.sh
## Descripción: Administración interactiva de la VM en Azure
## Autor: Paula Bolaños
## =========================================================
#
## Variables base
RESOURCE_GROUP="rg-fundamentos"
VM_NAME="vm-linux-fundamentos"
LOG_FILE="vm_actions.log"

# Función para registrar acciones en el log
log_action() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
    }

    # Función para verificar estado de la VM
    check_status() {
        STATUS=$(az vm get-instance-view \
                --name $VM_NAME \
                        --resource-group $RESOURCE_GROUP \
                                --query "instanceView.statuses[?starts_with(code,'PowerState/')].displayStatus" \
                                        --output tsv)
                                            
                                                echo "🔹 Estado actual de la VM: $STATUS"
                                                    log_action "Estado verificado: $STATUS"
                                                    }

                                                    # Función para iniciar la VM
                                                    start_vm() {
                                                        echo "🚀 Iniciando la VM..."
                                                            az vm start --name $VM_NAME --resource-group $RESOURCE_GROUP
                                                                check_status
                                                                    log_action "VM iniciada correctamente ($VM_NAME)"
                                                                    }

                                                                    # Función para detener la VM
                                                                    stop_vm() {
                                                                        echo "🛑 Deteniendo la VM..."
                                                                            az vm deallocate --name $VM_NAME --resource-group $RESOURCE_GROUP
                                                                                check_status
                                                                                    log_action "VM detenida correctamente ($VM_NAME)"
                                                                                    }

                                                                                    # Menú interactivo
                                                                                    while true; do
                                                                                        clear
                                                                                            echo "=========================================="
                                                                                                echo "     ⚙️  ADMINISTRACIÓN DE LA VM AZURE"
                                                                                                    echo "=========================================="
                                                                                                        echo "1️⃣  Ver estado de la VM"
                                                                                                            echo "2️⃣  Iniciar VM"
                                                                                                                echo "3️⃣  Detener VM"
                                                                                                                    echo "4️⃣  Salir"
                                                                                                                        echo "=========================================="
                                                                                                                            read -p "Selecciona una opción [1-4]: " opcion

                                                                                                                                case $opcion in
                                                                                                                                        1) check_status ;;
                                                                                                                                                2) start_vm ;;
                                                                                                                                                        3) stop_vm ;;
                                                                                                                                                                4) echo "👋 Saliendo..."; exit 0 ;;
                                                                                                                                                                        *) echo "❌ Opción no válida." ;;
                                                                                                                                                                            esac

                                                                                                                                                                                echo ""
                                                                                                                                                                                    read -p "Presiona ENTER para continuar..."
                                                                                                                                                                                    done

