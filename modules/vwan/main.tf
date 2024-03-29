//Create Azure vWAN
resource "azurerm_virtual_wan" "vwan" {
  name                = "${var.prefix}-vwan"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

//Create Azure vHUB
resource "azurerm_virtual_hub" "vhub" {
  name                = "${var.prefix}-vhub"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  sku                 = "Standard"
  address_prefix      = var.vhub_cidr

  tags = var.tags
}

//Create Azure vHUB route table
resource "azurerm_virtual_hub_route_table" "vhub_rt_spoke" {
  name           = "${var.prefix}-vhub-rt-spoke"
  virtual_hub_id = azurerm_virtual_hub.vhub.id
  labels         = ["rt-spoke"]

  route {
    name              = "rt-spoke-default"
    destinations_type = "CIDR"
    destinations      = ["0.0.0.0/0"]
    next_hop_type     = "ResourceId"
    next_hop          = azurerm_virtual_hub_connection.vhub_connnection_vnet_fgt.id
  }
}

//Create connection to provided VNET FGT
resource "azurerm_virtual_hub_connection" "vhub_connnection_vnet_fgt" {
  name                      = "${var.prefix}-cx-vnet-fgt"
  virtual_hub_id            = azurerm_virtual_hub.vhub.id
  remote_virtual_network_id = var.vnet-fgt_id
}


//Create BGP connection to FGT VNET
resource "azurerm_virtual_hub_bgp_connection" "vhub_bgp_fgt-1" {
  depends_on                    = [azurerm_virtual_hub_connection.vhub_connnection_vnet_fgt]
  name                          = "${var.prefix}-vhub-bgp-cx-fgt-active"
  virtual_hub_id                = azurerm_virtual_hub.vhub.id
  peer_asn                      = var.fgt-cluster_bgp-asn
  peer_ip                       = var.fgt-cluster_active-ip
  virtual_network_connection_id = azurerm_virtual_hub_connection.vhub_connnection_vnet_fgt.id
}

resource "azurerm_virtual_hub_bgp_connection" "vhub_bgp_fgt-2" {
  depends_on                    = [azurerm_virtual_hub_connection.vhub_connnection_vnet_fgt]
  name                          = "${var.prefix}-vhub-bgp-cx-fgt-passive"
  virtual_hub_id                = azurerm_virtual_hub.vhub.id
  peer_asn                      = var.fgt-cluster_bgp-asn
  peer_ip                       = var.fgt-cluster_passive-ip
  virtual_network_connection_id = azurerm_virtual_hub_connection.vhub_connnection_vnet_fgt.id
}

//Create connection to provided VNETs
resource "azurerm_virtual_hub_connection" "vhub_connnection_vnet_spoke" {
  count                     = var.vnet_connection == null ? 0 : length(var.vnet_connection)
  name                      = "${var.prefix}-cx-vnet-${count.index + 1}"
  virtual_hub_id            = azurerm_virtual_hub.vhub.id
  remote_virtual_network_id = var.vnet_connection[count.index]

  routing {
    associated_route_table_id = azurerm_virtual_hub_route_table.vhub_rt_spoke.id
    propagated_route_table {
      route_table_ids = [azurerm_virtual_hub.vhub.default_route_table_id]
    }
  } 
} 