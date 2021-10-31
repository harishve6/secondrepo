variable "firewallname" {
  description = "The name of the Azure Firewall" 
}
variable "location" {
  description = "Location of the firewall"
}
variable "resourcegroup_name" {
  description = "Name of the resource group"
}
variable "firewall_pip_name" {
  description = "Firewall public IP name"
}
variable "firewall_policy_name" {
  description = "Firewall Policy Name"
}
variable "firewall_subnet_address_space" {
  description = "Address space for firewall subnet"
}
variable "vnet_name" {
  description = "Name of the VNet of firewall"
}
variable "firewall_subnet_name" {
  description = "Name of the firewall subnet"
}