# List of modules for Azure deployments

This is a collection of modules for Fortinet deployments in Azure Cloud.

## List of modules
- [module faz](./modules/faz)
- [module fgt](./modules/fgt)
- [module fgt-config](./modules/fgt-config)
- [module fgt-config_4ports](./modules/fgt-config_4ports)
- [module fgt-ha](./modules/fgt-ha)
- [module fgt-ha_4ports](./modules/fgt-ha_4ports)
- [module fgt-ha_ni-nsg](./modules/fgt-ha_ni-nsg)
- [module fmg](./modules/fmg)
- [module routeserver](./modules/routeserver)
- [module vm](./modules/new) 
- [module vnet-fgt](./modules/vnet-fgt)
- [module vnet-fgt_4ports](./modules/vnet-fgt_4ports)
- [module vnet-spoke](./modules/vnet-spoke)
- [module vwan](./modules/vwan)
- [module xlb](./modules/xlb)
      
## Deployment considerations:
   - Create file terraform.tfvars using terraform.tfvars.example as template 
   - Update variables in var.tf with fortigate cluster deployment
   - You will be charged for this deployment

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Check particulars requiriments for each deployment (AWS) 

# Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.

