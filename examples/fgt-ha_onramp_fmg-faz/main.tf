#------------------------------------------------------------------
# Create FGT onramp:
# - Create FGT cluster config (FGCP - FMG - FAZ - SDWAN spoke)
# - Create FGT instances with config
# - Create FGT vNET
# - Create FMG and FAZ instances
#------------------------------------------------------------------
module "fgt_config" {
  source = "../../modules/fgt-config"

  admin_cidr     = local.admin_cidr
  admin_port     = local.admin_port
  rsa-public-key = trimspace(tls_private_key.ssh.public_key_openssh)
  api_key        = trimspace(random_string.api_key.result)

  subnet_cidrs       = module.fgt_vnet.subnet_cidrs
  fgt-active-ni_ips  = module.fgt_vnet.fgt-active-ni_ips
  fgt-passive-ni_ips = module.fgt_vnet.fgt-passive-ni_ips

  # Config for SDN connector
  # - API calls (optional)
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  resource_group_name = local.resource_group_name == null ? azurerm_resource_group.rg[0].name : local.resource_group_name
  # -

  config_fgcp = true
  config_fmg  = true
  config_faz  = true
  fmg_ip      = module.fmg.fmg_private_ip
  faz_ip      = module.faz.faz_private_ip

  vpc-spoke_cidr = [module.fgt_vnet.subnet_cidrs["bastion"]]
}

// Create FGT cluster spoke
// (Example with a full scenario deployment with all modules)
module "fgt" {
  source = "../../modules/fgt-ha"

  prefix                   = local.prefix
  location                 = local.location
  resource_group_name      = local.resource_group_name == null ? azurerm_resource_group.rg[0].name : local.resource_group_name
  tags                     = local.tags
  storage-account_endpoint = local.storage-account_endpoint == null ? azurerm_storage_account.storageaccount[0].primary_blob_endpoint : local.storage-account_endpoint

  admin_username = local.admin_username
  admin_password = local.admin_password

  fgt-active-ni_ids  = module.fgt_vnet.fgt-active-ni_ids
  fgt-passive-ni_ids = module.fgt_vnet.fgt-passive-ni_ids
  fgt_config_1       = module.fgt_config.fgt_config_1
  fgt_config_2       = module.fgt_config.fgt_config_2

  fgt_passive  = true
  license_type = local.fgt_license_type
}

// Module VNET for FGT
// - This module will generate VNET and network intefaces for FGT cluster
module "fgt_vnet" {
  source = "../../modules/vnet-fgt"

  prefix              = "${local.prefix}-spoke"
  location            = local.location
  resource_group_name = local.resource_group_name == null ? azurerm_resource_group.rg[0].name : local.resource_group_name
  tags                = local.tags

  vnet-fgt_cidr = local.fgt_vnet_cidr
  admin_port    = local.admin_port
  admin_cidr    = local.admin_cidr
}

#------------------------------------------------------------------------------
# Create FAZ and FMG
#------------------------------------------------------------------------------
// Create FAZ instances
module "faz" {
  source = "../../modules/faz"

  prefix                   = local.prefix
  location                 = local.location
  resource_group_name      = local.resource_group_name == null ? azurerm_resource_group.rg[0].name : local.resource_group_name
  tags                     = local.tags
  storage-account_endpoint = local.storage-account_endpoint == null ? azurerm_storage_account.storageaccount[0].primary_blob_endpoint : local.storage-account_endpoint

  rsa-public-key = trimspace(tls_private_key.ssh.public_key_openssh)
  api_key        = trimspace(random_string.api_key.result)
  license_type   = local.faz_license_type
  license_file   = local.faz_license_file

  admin_username = local.admin_username
  admin_password = local.admin_password

  subnet_ids = {
    public  = module.fgt_vnet.subnet_ids["public"]
    private = module.fgt_vnet.subnet_ids["bastion"]
  }
  subnet_cidrs = {
    public  = module.fgt_vnet.subnet_cidrs["public"]
    private = module.fgt_vnet.subnet_cidrs["bastion"]
  }
}
// Create FMG instances
module "fmg" {
  source = "../../modules/fmg"

  prefix                   = local.prefix
  location                 = local.location
  resource_group_name      = local.resource_group_name == null ? azurerm_resource_group.rg[0].name : local.resource_group_name
  tags                     = local.tags
  storage-account_endpoint = local.storage-account_endpoint == null ? azurerm_storage_account.storageaccount[0].primary_blob_endpoint : local.storage-account_endpoint

  rsa-public-key = trimspace(tls_private_key.ssh.public_key_openssh)
  api_key        = trimspace(random_string.api_key.result)
  license_type   = local.fmg_license_type
  license_file   = local.fmg_license_file

  admin_username = local.admin_username
  admin_password = local.admin_password

  subnet_ids = {
    public  = module.fgt_vnet.subnet_ids["public"]
    private = module.fgt_vnet.subnet_ids["bastion"]
  }
  subnet_cidrs = {
    public  = module.fgt_vnet.subnet_cidrs["public"]
    private = module.fgt_vnet.subnet_cidrs["bastion"]
  }
}