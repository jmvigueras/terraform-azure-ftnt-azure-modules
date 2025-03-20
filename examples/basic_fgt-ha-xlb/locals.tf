locals {
  #-----------------------------------------------------------------------------------------------------
  # LB variables
  #-----------------------------------------------------------------------------------------------------
  config_gwlb        = false
  ilb_ip             = var.ilb_ip == null ? cidrhost(module.fgt_vnet.subnet_cidrs["private"], 9) : var.ilb_ip
  backend_probe_port = var.backend_probe_port == null ? "8008" : var.backend_probe_port

  admin_password = var.admin_password == null ? random_string.admin_password.result : var.admin_password

  storage_account_endpoint = var.storage-account_endpoint == null ? azurerm_storage_account.storageaccount[0].primary_blob_endpoint : var.storage-account_endpoint
}

