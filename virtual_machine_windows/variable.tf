variable "resourcegroup_name" {
  description = "Name of the Resource group"
}
variable "location" {
  description = "Location of the VM"
}
variable "vm_name" {
  description = "Name of the Virtual Machine"
}
variable "vm_size" {
  description = "Size of the Virtual Machine"
}
variable "vm_username" {
  description = "Username for VM login"
}
variable "vm_password" {
  description = "Password for VM login"
}
variable "vm_nic_name" {
  description = "Name of the Network Interface"
}
variable "vm-subnet-id" {
  description = "Subnet ID for the Virtual Machine's Network Interface"
}
variable "env" {
  description = "Environment of the Virtual Machine"
}
