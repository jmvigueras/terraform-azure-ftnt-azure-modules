# Terraform module: VNET to act as spoke of a Fortigate Cluster

This module IaC is a part of a full deployment of a Fortigate cluster in a sandwich configuration. This terraform code will deploy spoke VNETs with preconfigured subnets: subnet-1, subnet-2, GatewaySubnet, RouterServer, PrivateLinkSubnet, PrivateLinkServicesSubnet. Network Security Groups and interfaces in subnet-1 y subnet-2 of each VNET are also created, for attached to future test VM deployed in those subnets.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsr_spoke_egress_allow_all](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.nsr_spoke_ingress_allow_all](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet.vnet-spoke_subnet_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vnet-spoke_subnet_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vnet-spoke_subnet_routeserver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vnet-spoke_subnet_vgw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.subnet_1_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.subnet_2_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet-spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.peerSpoketoFGT-1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peerSpoketoFGT-2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Region for deployment | `string` | `"francecentral"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Azure resourcers prefix description added in name | `string` | `"module-vnet-spoke"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Azure resourcers tags | `map(string)` | <pre>{<br>  "Deploy": "module-vnet-spoke",<br>  "Project": "fortinet-deploy"<br>}</pre> | no |
| <a name="input_vnet_fgt"></a> [vnet\_fgt](#input\_vnet\_fgt) | VNET ID of FGT VNET for peering | `map(string)` | `null` | no |
| <a name="input_vnet_spoke_cidr"></a> [vnet\_spoke\_cidr](#input\_vnet\_spoke\_cidr) | List of CIDR ranges for vnets spoke (it will create as much VNET as ranges) (this module will deploy as much VNETs as CIDRS appears) | `string` | `"172.20.100.0/23"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | n/a |
| <a name="output_subnet_cidrs"></a> [subnet\_cidrs](#output\_subnet\_cidrs) | n/a |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | n/a |
| <a name="output_subnet_names"></a> [subnet\_names](#output\_subnet\_names) | n/a |
| <a name="output_vnet_cidr"></a> [vnet\_cidr](#output\_vnet\_cidr) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
<!-- END_TF_DOCS -->

# Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.