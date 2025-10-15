output "public_ip" {
  description = "Dirección IP pública de la VM"
  value       = azurerm_public_ip.vm_ip.ip_address
}
