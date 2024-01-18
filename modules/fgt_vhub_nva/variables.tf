variable "resource_group_name" {
  description = "Azure Resource Group name"
  type = string
}

variable "managed_resource_group_name" {
  description = "Name for managed resource group created for NVA resources"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tag for resources"
  type = map(any)
  default = {
    Deploy  = "module-azure_vhub"
    Project = "terraform-fortinet"
  }
}

variable "prefix" {
  description = "Name prefix to add Azure objects"
  type    = string
  default = "terraform"
}

variable "location" {
  description = "Region for HUB Azure deployment"
  type    = string
  default = "francecentral"
}

variable "admin_username" {
  description = "Admin user for NVA fortigate"
  type    = string
  default = "fgtuser"
}

variable "admin_password" {
  description = "Admin password for NVA fortigate"
  type    = string
  default = null
}

variable "fgt_version" {
  description = "FortiOS version"
  type    = string
  default = "7.4.0"
}

variable "fgt_bgp_asn" {
  description = "Fortigate BGP ASN"
  type    = string
  default = "65001"
}

variable "scale_unit" {
  description = "Default NVA scale units"
  type    = string
  default = "2"
}

variable "vhub_id" {
  description = "Virtual HUB ID"
  type    = string
}

variable "vhub_bgp_peers" {
  description = "Default value for vHUB RouteServer"
  type    = list(string)
  default = ["10.0.252.68", "10.0.252.69"]
}

variable "vhub_bgp_asn" {
  description = "Default value for vHUB ASN"
  type    = string
  default = "65515"
}

variable "fmg_ip" {
  description = "Default value for FortiManger IP"
  type    = string
  default = "2.3.4.5"
}

variable "fmg_sn" {
  description = "Default value for FortiManger SN"
  type    = string
  default = "SN123456789"
}

variable "nva_plan_version" {
  description = "Default Fortigate NVA plan version"
  type    = string
  default = "2.0.011"
}

variable "fortiGateImageSKU" {
  description = "fortiGateImageSKU, can be either fortinet-sdwan-and-ngfw (NGFW+SDWAN) or fortinet-ngfw (NGFW)"
  type = string
  default = "fortinet-sdwan-and-ngfw"
}

variable "nva_plan_name" {
  description = "fortiGateImageSKU, can be either managedfgtngfw (NGFW) or managedfgthybrid (NGFW+SDWAN)"
  type = string
  default = "managedfgthybrid"
}