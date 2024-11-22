output "fgt" {
  value = {
    admin        = var.admin_username
    pass         = local.admin_password
    active_mgmt  = "https://${module.fgt_vnet.fgt-active-mgmt-ip}:${var.admin_port}"
    passive_mgmt = "https://${module.fgt_vnet.fgt-passive-mgmt-ip}:${var.admin_port}"
  }
}

