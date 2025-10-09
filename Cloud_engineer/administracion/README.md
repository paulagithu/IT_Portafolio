# Administración y Scripting – Azure Cloud Engineer Training

## 🎯 Objetivo
Aprender tareas de administración básica en Azure y comenzar con automatización mediante Azure CLI y scripts.

---

## 1. Verificar estado de la VM

Comando para listar máquinas virtuales en la suscripción:

```bash
az vm list -d -o table
```
![Estado VM](images/estado_vm.png).


## 2. Administración básica de la máquina virtual

Durante esta actividad se practicaron las operaciones principales sobre la VM Linux desde **Azure CLI**:

- 🔄 **Reiniciar VM:**
  ```bash
  az vm restart --resource-group rg-fundamentos --name vm-linux-fundamentos

- 🔄 **Detener VM:**
  ```bash
  az vm deallocate --resource-group rg-fundamentos --name vm-linux-fundamentos
  ```
- 🔄 **Encender VM:**
 ```bash
    az login
    az vm start --resource-group rg-fundamentos --name vm-linux-fundamentos
 ```
- 🔄 **Reconexion por SSH:**
 ```bash
    ssh -i vm-linux-fundamentos_key azureuser@<public-ip>
 ``` 
![Admon](images/captura_admon.png).

## 3. Administración de usuarios y roles

En esta sección se muestra cómo se asignó un rol a un usuario existente para administrar la VM.  
Debido al plan gratuito de Azure AD, no es posible crear nuevos usuarios; se utilizó el usuario de Microsoft asociado a la cuenta del portal.

**Usuario asignado:** p.1xx@live.com  
**Rol asignado:** Virtual Machine Contributor  
**Recurso:** VM `vm-linux-fundamentos`

![Asignación de rol a usuario](images/rol_asignado.png)

> Nota: Este rol permite al usuario administrar la máquina virtual (iniciar, detener, reiniciar, modificar configuración), sin otorgar permisos globales sobre Azure AD o la suscripción completa.

## 4. Monitoring y alertas

Se habilitó **VM Insights** para la VM `vm-linux-fundamentos`.  
Azure comenzó a recopilar métricas como CPU, memoria y disco. Los datos estarán disponibles automáticamente después de unos minutos.

![Habilitación de Insights](images/monitoring_vm.png)

## 5. Configuración de alerta para CPU alta

Se creó una alerta para notificar cuando la CPU de la VM `vm-linux-fundamentos` supera el 80%.

![Alerta CPU creada](images/alerta_cpu.png)

## 6. Script interactivo para administración de la VM

Se creó un script Bash para automatizar tareas básicas de administración desde Azure CLI o WSL.
El script permite iniciar, detener y verificar el estado de la máquina virtual mediante un menú interactivo, y genera un registro de acciones con la fecha y hora de cada operación.

![vm_admon.sh:](scripts/vm_admin.sh)

Funciones principales:
Verificar el estado actual de la VM
Iniciar o detener la máquina virtual
Registrar cada acción en vm_actions.log

![](images/vm_control.png) ![](images/action_logs.png)

## 7. Diagnóstico y troubleshooting de la VM

**Comandos ejecutados:**
```bash
az monitor activity-log list --resource-group RG-FUNDAMENTOS --max-events 10 --output table
az vm show -g RG-FUNDAMENTOS -n vm-linux-fundamentos --query id -o tsv
az monitor metrics list --resource <ID_VM> --metric "Percentage CPU"
az monitor metrics list --resource <ID_VM> --metric "Disk Read Bytes" "Disk Write Bytes"
az monitor metrics list --resource <ID_VM> --metric "Network In Total" "Network Out Total"
```

En este paso se revisaron los logs de actividad y las métricas de rendimiento (CPU, disco, red) de la máquina virtual.
Los resultados se exportaron en formato JSON y una captura del log fue almacenada en images/activity_log_vm.png para evidencia visual del diagnóstico.
![activity_log](images/activity_log_vm.png)
