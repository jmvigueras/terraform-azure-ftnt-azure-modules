variable "storage-account_endpoint" {
  type    = string
  default = null
}

variable "resource_group_name" {
  type    = string
  default = null
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}
variable "admin_password" {
  type    = string
  default = null
}

variable "rsa-public-key" {
  description = "SSH RSA public key for KeyPair if not exists"
  type    = string
  default = null
}

variable "prefix" {
  description = "Azure resourcers prefix description"
  type    = string
  default = "terraform"
}

variable "tags" {
  description = "Azure resourcers tags"
  type = map(any)
  default = {
    Deploy  = "module-vms"
    Project = "terraform-fortinet"
  }
}

variable "vm_size" {
  description = "For testing VMs"
  type    = string
  default = "Standard_B1ms"
}

variable "subnet_id" {
  description = "VM Subnet ID"
  type    = string
  default = null
}

variable "subnet_cidr" {
  description = "VM Subnet CIDR"
  type    = string
  default = null
}


variable "ni_ip" {
  description = "VM private IP"
  type    = string
  default = null
}

variable "location" {
  description = "Azure locatio (default europe-west4)"
  type    = string
  default = "europe-west4"
}

variable "user_data" {
  description = "VM custom data"
  type    = string
  default = null
}