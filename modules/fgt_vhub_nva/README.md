# Terraform Module: Fortigate NVA Managed Application

Create a Fortigate Managed Application inside Virtual HUB

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
| [azurerm_managed_application.fgt_vhub_nva](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for NVA fortigate | `string` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Admin user for NVA fortigate | `string` | `"fgtuser"` | no |
| <a name="input_fgt_bgp_asn"></a> [fgt\_bgp\_asn](#input\_fgt\_bgp\_asn) | Fortigate BGP ASN | `string` | `"65001"` | no |
| <a name="input_fgt_version"></a> [fgt\_version](#input\_fgt\_version) | FortiOS version | `string` | `"7.4.0"` | no |
| <a name="input_fmg_ip"></a> [fmg\_ip](#input\_fmg\_ip) | Default value for FortiManger IP | `string` | `"2.3.4.5"` | no |
| <a name="input_fmg_sn"></a> [fmg\_sn](#input\_fmg\_sn) | Default value for FortiManger SN | `string` | `"SN123456789"` | no |
| <a name="input_fortiGateImageSKU"></a> [fortiGateImageSKU](#input\_fortiGateImageSKU) | fortiGateImageSKU, can be either fortinet-sdwan-and-ngfw (NGFW+SDWAN) or fortinet-ngfw (NGFW) | `string` | `"fortinet-sdwan-and-ngfw"` | no |
| <a name="input_location"></a> [location](#input\_location) | Region for HUB Azure deployment | `string` | `"francecentral"` | no |
| <a name="input_managed_resource_group_name"></a> [managed\_resource\_group\_name](#input\_managed\_resource\_group\_name) | Name for managed resource group created for NVA resources | `string` | `null` | no |
| <a name="input_nva_plan_name"></a> [nva\_plan\_name](#input\_nva\_plan\_name) | fortiGateImageSKU, can be either managedfgtngfw (NGFW) or managedfgthybrid (NGFW+SDWAN) | `string` | `"managedfgthybrid"` | no |
| <a name="input_nva_plan_version"></a> [nva\_plan\_version](#input\_nva\_plan\_version) | Default Fortigate NVA plan version | `string` | `"2.0.011"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix to add Azure objects | `string` | `"terraform"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure Resource Group name | `string` | n/a | yes |
| <a name="input_scale_unit"></a> [scale\_unit](#input\_scale\_unit) | Default NVA scale units | `string` | `"2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag for resources | `map(any)` | <pre>{<br>  "Deploy": "module-azure_vhub",<br>  "Project": "terraform-fortinet"<br>}</pre> | no |
| <a name="input_vhub_bgp_asn"></a> [vhub\_bgp\_asn](#input\_vhub\_bgp\_asn) | Default value for vHUB ASN | `string` | `"65515"` | no |
| <a name="input_vhub_bgp_peers"></a> [vhub\_bgp\_peers](#input\_vhub\_bgp\_peers) | Default value for vHUB RouteServer | `list(string)` | <pre>[<br>  "10.0.252.68",<br>  "10.0.252.69"<br>]</pre> | no |
| <a name="input_vhub_id"></a> [vhub\_id](#input\_vhub\_id) | Virtual HUB ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_outputs"></a> [outputs](#output\_outputs) | Deployment outputs |
| <a name="output_parameters"></a> [parameters](#output\_parameters) | Deployment parameters |
<!-- END_TF_DOCS -->