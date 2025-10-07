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

### Captura #3 – Asignación de rol a la VM
![Asignación de rol a usuario](Images/captura_rol_asignado.png)

> Nota: Este rol permite al usuario administrar la máquina virtual (iniciar, detener, reiniciar, modificar configuración), sin otorgar permisos globales sobre Azure AD o la suscripción completa.
