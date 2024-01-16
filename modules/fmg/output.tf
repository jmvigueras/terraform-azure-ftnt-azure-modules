output "fmg_id" {
  value = azurerm_virtual_machine.fmg.id
}

output "admin_username" {
  value = var.admin_username
}

output "admin_password" {
  value = var.admin_password
}

output "fmg_public_ip" {
  value = azurerm_public_ip.fmg_public-ip.ip_address
}

output "fmg_private_ip" {
  value = local.fmg_ni_private_ip
}