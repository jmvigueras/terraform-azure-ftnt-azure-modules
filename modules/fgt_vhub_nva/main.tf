###########################################################################
# Create vHUB Managed Application
###########################################################################
locals {
  adminUsername       = trimspace(trim(var.admin_username, "*!?-_."))
  adminPassword       = trimspace(var.admin_password)
  fortiGateNamePrefix = trimspace(var.prefix)
}

// Create NVA
resource "azurerm_managed_application" "fgt_vhub_nva" {
  name                        = var.prefix
  location                    = var.location
  resource_group_name         = var.resource_group_name
  kind                        = "MarketPlace"
  managed_resource_group_name = var.managed_resource_group_name != null ? var.managed_resource_group_name : "${var.resource_group_name}-mrg-nva"

  parameter_values = jsonencode({
    adminUsername = {
      value = local.adminUsername
    },
    adminPassword = {
      value = local.adminPassword
    },
    fortiGateNamePrefix = {
      value = local.fortiGateNamePrefix
    },
    fortiGateImageVersion = {
      value = var.fgt_version
    },
    hubId = {
      value = var.vhub_id
    },
    fortiGateASN = {
      value = var.fgt_bgp_asn
    },
    scaleUnit = {
      value = var.scale_unit
    },
    hubRouters = {
      value = var.vhub_bgp_peers
    },
    hubASN = {
      value = var.vhub_bgp_asn
    },
    fortiGateImageSKU = {
      value = var.fortiGateImageSKU
    }
    fortiManagerIP = {
      value = var.fmg_ip
    }
    fortiManagerSerial = {
      value = var.fmg_sn
    }
    tags = {
      value = var.tags
    }
    location = {
      value = var.location
    }
  })
  plan {
    name      = var.nva_plan_name
    product   = "fortigate_vwan_nva"
    publisher = "fortinet"
    version   = var.nva_plan_version
  }

  tags = var.tags
}




