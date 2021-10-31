variable "bastion_host_name" {
  description = "The name of the bastion host"
  default = "Bastion_Host"
}
variable "bastion_pip" {
  description = "Public IP of Bastion Host"
}
variable "resourcegroup_name" {
  description = "Resource group Name"
}
variable "vnet_name" {
  description = "Virtual Network Name"
}
variable "bastion_subnet_address_space" {
  description = "address space for bastion subnet"
}
variable "location" {
  description = "location of the bastion"
}
