#------------------------------------------------------------------------------
# Create FAZ interfaces
#------------------------------------------------------------------------------
// FAZ public IP
resource "azurerm_public_ip" "fmg_public-ip" {
  name                = "${var.prefix}-fmg-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  sku_tier            = "Regional"

  tags = var.tags
}
// FAZ Network Interface (public subnet)
resource "azurerm_network_interface" "fmg_ni_public" {
  name                = "${var.prefix}-fmg-ni-public"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_ids["public"]
    private_ip_address_allocation = "Static"
    private_ip_address            = local.fmg_ni_public_ip
    primary                       = true
    public_ip_address_id          = azurerm_public_ip.fmg_public-ip.id
  }
  tags = var.tags
}
// FAZ Network Interface (private subnet)
resource "azurerm_network_interface" "fmg_ni_private" {
  name                = "${var.prefix}-fmg-ni-private"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_ids["private"]
    private_ip_address_allocation = "Static"
    private_ip_address            = local.fmg_ni_private_ip
  }
  tags = var.tags
}

#------------------------------------------------------------------------------
# Create FAZ VM
#------------------------------------------------------------------------------
resource "azurerm_virtual_machine" "fmg" {
  name                         = "${var.prefix}-fmg"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  network_interface_ids        = [local.fmg_ni_ids[var.fmg_ni_0], local.fmg_ni_ids[var.fmg_ni_1]]
  primary_network_interface_id = local.fmg_ni_ids[var.fmg_ni_0]
  vm_size                      = var.size

  lifecycle {
    ignore_changes = [os_profile]
  }

  storage_image_reference {
    publisher = var.publisher
    offer     = var.fmg_offer
    sku       = var.fmg_sku[var.license_type]
    version   = var.fmg_version
  }

  plan {
    publisher = var.publisher
    product   = var.fmg_offer
    name      = var.fmg_sku[var.license_type]
  }

  storage_os_disk {
    name              = "${var.prefix}-osdisk-fmg-${random_string.random.result}"
    caching           = "ReadWrite"
    managed_disk_type = "Standard_LRS"
    create_option     = "FromImage"
  }

  # Log data disks
  storage_data_disk {
    name              = "${var.prefix}-datadisk-fmg-${random_string.random.result}"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "30"
  }

  os_profile {
    computer_name  = "fmg"
    admin_username = var.admin_username
    admin_password = var.admin_password
    custom_data    = data.template_file.fmg_config.rendered
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = var.storage-account_endpoint
  }

  tags = var.tags
}

data "template_file" "fmg_config" {
  template = file("${path.module}/templates/fmg.conf")
  vars = {
    fmg_id           = "${var.prefix}-fmg"
    type             = var.license_type
    license_file     = var.license_file
    admin_username   = var.admin_username
    rsa-public-key   = trimspace(var.rsa-public-key)
    public_port      = var.public_port
    public_ip        = local.fmg_ni_public_ip
    public_mask      = cidrnetmask(var.subnet_cidrs["public"])
    public_gw        = cidrhost(var.subnet_cidrs["public"], 1)
    private_port     = var.private_port
    private_ip       = local.fmg_ni_private_ip
    private_mask     = cidrnetmask(var.subnet_cidrs["private"])
    private_gw       = cidrhost(var.subnet_cidrs["private"], 1)
    fmg_extra-config = var.fmg_extra-config
  }
}

# Random string to add at disk name
resource "random_string" "random" {
  length  = 5
  special = false
  numeric = false
  upper   = false
}

##############################################################################################################
# Accept the Terms license for the FortiGate Marketplace image
# This is a one-time agreement that needs to be accepted per subscription
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/marketplace_agreement
##############################################################################################################
/*
resource "azurerm_marketplace_agreement" "fortinet" {
  publisher = var.publisher
  offer     = var.fmg_offer
  plan      = var.fmg_sku[var.license_type]
}
*/