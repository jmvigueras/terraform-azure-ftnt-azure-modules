# Terraform Module: Azure Router Server

Create an Azure Router Server

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
| [azurerm_public_ip.public-ip-rs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_route_server.rs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_server) | resource |
| [azurerm_route_server_bgp_connection.rs-spoke-bgp-fgt-active](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_server_bgp_connection) | resource |
| [azurerm_route_server_bgp_connection.rs-spoke-bgp-fgt-passive](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_server_bgp_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fgt1_peer-ip"></a> [fgt1\_peer-ip](#input\_fgt1\_peer-ip) | n/a | `string` | `"172.31.3.10"` | no |
| <a name="input_fgt2_peer-ip"></a> [fgt2\_peer-ip](#input\_fgt2\_peer-ip) | n/a | `string` | `"172.31.3.11"` | no |
| <a name="input_fgt_bgp-asn"></a> [fgt\_bgp-asn](#input\_fgt\_bgp-asn) | n/a | `string` | `"65001"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"francecentral"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Azure resourcers prefix description | `string` | `"terraform"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Azure resourcers tags | `map(any)` | <pre>{<br>  "Deploy": "module-vnet-spoke",<br>  "Project": "terraform-fortinet"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rs_bgp-asn"></a> [rs\_bgp-asn](#output\_rs\_bgp-asn) | n/a |
| <a name="output_rs_peer"></a> [rs\_peer](#output\_rs\_peer) | n/a |
<!-- END_TF_DOCS -->

# Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.