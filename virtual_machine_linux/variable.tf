variable "resourcegroup_name" {
  description = "Name of the Resource Group"
}
variable "location" {
  description = "Location of the Virtual Machine"
}
variable "vm_nic_name" {
  description = "Name for the Network Interface"
}
variable "vm_subnet_id" {
  description = "ID of the subnet which contains the Virtual Machine"
}
variable "vm_name" {
  description = "Name of the Virtual Machine"
}
variable "vm_size" {
  description = "Size of the Virtual Machine"
}
variable "vm_username" {
  description = "Username for login into the Virtual Machine"
}
