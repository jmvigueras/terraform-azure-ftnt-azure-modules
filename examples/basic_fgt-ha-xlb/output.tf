output "fgt" {
  value = {
    admin        = var.admin_username
    pass         = local.admin_password
    active_mgmt  = "https://${module.fgt_vnet.fgt-active-mgmt-ip}:${var.admin_port}"
    passive_mgmt = "https://${module.fgt_vnet.fgt-passive-mgmt-ip}:${var.admin_port}"
  }
}

output "fgt_ips" {
  value = {
    fgt1 = module.fgt_vnet.fgt-active-ni_ips
    fgt2 = module.fgt_vnet.fgt-active-ni_ips
  }
}

output "subnet_ids" {
  value = module.fgt_vnet.subnet_ids
}

output "subnet_cidrs" {
  value = module.fgt_vnet.subnet_cidrs
}

output "vnet" {
  value = module.fgt_vnet.vnet
}

output "public_key_openssh" {
  value = trimspace(tls_private_key.ssh.public_key_openssh)
}

output "resource_group_name" {
  value = var.resource_group_name == null ? azurerm_resource_group.rg[0].name : var.resource_group_name
}

output "storage_account_endpoint" {
  value = local.storage_account_endpoint
}