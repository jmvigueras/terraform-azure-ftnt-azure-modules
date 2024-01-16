output "faz_id" {
  value = azurerm_virtual_machine.faz.id
}

output "admin_username" {
  value = var.admin_username
}

output "admin_password" {
  value = var.admin_password
}

output "faz_public_ip" {
  value = azurerm_public_ip.faz_public-ip.ip_address
}

output "faz_private_ip" {
  value = local.faz_ni_private_ip
}