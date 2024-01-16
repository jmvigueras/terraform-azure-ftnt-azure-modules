# Terraform module: Azure Virtual WAN

Deploy Azure Virtual WAN module

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
| [azurerm_virtual_hub.vhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub) | resource |
| [azurerm_virtual_hub_bgp_connection.vhub_bgp_fgt-1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_bgp_connection) | resource |
| [azurerm_virtual_hub_bgp_connection.vhub_bgp_fgt-2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_bgp_connection) | resource |
| [azurerm_virtual_hub_connection.vhub_connnection_vnet_fgt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) | resource |
| [azurerm_virtual_hub_connection.vhub_connnection_vnet_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) | resource |
| [azurerm_virtual_hub_route_table.vhub_rt_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_route_table) | resource |
| [azurerm_virtual_wan.vwan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fgt-cluster_active-ip"></a> [fgt-cluster\_active-ip](#input\_fgt-cluster\_active-ip) | FGT active member IP | `string` | `null` | no |
| <a name="input_fgt-cluster_bgp-asn"></a> [fgt-cluster\_bgp-asn](#input\_fgt-cluster\_bgp-asn) | n/a | `string` | `"65001"` | no |
| <a name="input_fgt-cluster_passive-ip"></a> [fgt-cluster\_passive-ip](#input\_fgt-cluster\_passive-ip) | FGT Passive member IP | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Region for HUB Azure deployment | `string` | `"francecentral"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `"terraform"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_subnet-fgt_ids"></a> [subnet-fgt\_ids](#input\_subnet-fgt\_ids) | VNET FGT subnets IDs | `map(any)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Azure resourcers tags | `map(any)` | <pre>{<br>  "Deploy": "module-azure_vhub",<br>  "Project": "terraform-fortinet"<br>}</pre> | no |
| <a name="input_vhub_cidr"></a> [vhub\_cidr](#input\_vhub\_cidr) | List of VNET to connect to vHUB | `string` | `"10.0.252.0/23"` | no |
| <a name="input_vnet-fgt_id"></a> [vnet-fgt\_id](#input\_vnet-fgt\_id) | VNET FGT to connect to vHUB | `string` | `null` | no |
| <a name="input_vnet_connection"></a> [vnet\_connection](#input\_vnet\_connection) | List of VNET to connect to vHUB | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bgp-asn"></a> [bgp-asn](#output\_bgp-asn) | n/a |
| <a name="output_default-route-table_id"></a> [default-route-table\_id](#output\_default-route-table\_id) | n/a |
| <a name="output_vhub_rt_default_id"></a> [vhub\_rt\_default\_id](#output\_vhub\_rt\_default\_id) | n/a |
| <a name="output_vhub_rt_spoke_id"></a> [vhub\_rt\_spoke\_id](#output\_vhub\_rt\_spoke\_id) | n/a |
| <a name="output_virtual_hub_id"></a> [virtual\_hub\_id](#output\_virtual\_hub\_id) | n/a |
| <a name="output_virtual_router_ips"></a> [virtual\_router\_ips](#output\_virtual\_router\_ips) | n/a |
| <a name="output_vwan_id"></a> [vwan\_id](#output\_vwan\_id) | n/a |
<!-- END_TF_DOCS -->

# Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.