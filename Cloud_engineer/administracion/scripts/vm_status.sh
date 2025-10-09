#!/bin/bash
# vm_status.sh — Ver, encender o apagar VM (compatible con etiquetas en español o inglés)

RESOURCE_GROUP="RG-FUNDAMENTOS"
VM_NAME="vm-linux-fundamentos"
LOGFILE="../logs/vm_status.log"

mkdir -p "$(dirname "$LOGFILE")"

log() {
  echo "$1" | tee -a "$LOGFILE"
  }

  get_power_state() {
    local STATUS
      STATUS=$(az vm get-instance-view --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" \
          --query "instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus" -o tsv 2>/dev/null)
            echo "$STATUS"
            }

            normalize_state() {
              local RAW="$1"
                RAW=$(echo "$RAW" | tr '[:upper:]' '[:lower:]')
                  if [[ "$RAW" == *"running"* ]]; then
                      echo "running"
                        elif [[ "$RAW" == *"deallocated"* ]]; then
                            echo "deallocated"
                              elif [[ "$RAW" == *"stopped"* ]]; then
                                  echo "stopped"
                                    else
                                        echo "unknown"
                                          fi
                                          }

                                          log "----------------------------------------"
                                          log "Ejecución: $(date)"

                                          RAW_STATE=$(get_power_state)
                                          STATE=$(normalize_state "$RAW_STATE")

                                          log "Estado actual: $RAW_STATE"

                                          case "$STATE" in
                                            deallocated|stopped)
                                                read -p "La VM está apagada. ¿Deseas encenderla? (s/n): " opt
                                                    if [[ "$opt" =~ ^[sS]$ ]]; then
                                                          log "Iniciando VM..."
                                                                az vm start --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" >> "$LOGFILE" 2>&1
                                                                      log "Nuevo estado: $(get_power_state)"
                                                                          else
                                                                                log "No se inició la VM."
                                                                                    fi
                                                                                        ;;
                                                                                          running)
                                                                                              echo ""
                                                                                                  echo "La VM está en ejecución."
                                                                                                      read -p "¿Deseas apagarla? (d = deallocate, p = stop, n = no): " opt2
                                                                                                          if [[ "$opt2" =~ ^[dD]$ ]]; then
                                                                                                                log "Liberando hardware (deallocate)..."
                                                                                                                      az vm deallocate --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" >> "$LOGFILE" 2>&1
                                                                                                                            log "Nuevo estado: $(get_power_state)"
                                                                                                                                elif [[ "$opt2" =~ ^[pP]$ ]]; then
                                                                                                                                      log "Apagando VM (stop)..."
                                                                                                                                            az vm stop --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" >> "$LOGFILE" 2>&1
                                                                                                                                                  log "Nuevo estado: $(get_power_state)"
                                                                                                                                                      else
                                                                                                                                                            log "No se realizaron cambios."
                                                                                                                                                               fi
                                                                                                                                                                    ;;
                                                                                                                                                                      *)
                                                                                                                                                                          log "Estado desconocido o error al consultar. No se realizaron cambios."
                                                                                                                                                                              ;;
                                                                                                                                                                              esac

                                                                                                                                                                              log "Fin de ejecución."
                                                                                                                                                                              log "----------------------------------------"

