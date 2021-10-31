variable "resourcegroup_name" {
  description = "Name of the Resource Group"
}
variable "location" {
  description = "Location of the app gateway"
}
variable "vnet_name" {
  description = "Name of the Virtual Network"
}
variable "appgw_subnet_name" {
  description = "Name for the App Gateway subnet"
}
variable "appgw_subnet_addr" {
  description = "CIDR address space for app gateway subnet"
}
variable "appgw_nsg" {
  description = "Name of the App Gateway NSG"
}
variable "appgw_pip_name" {
  description = "Name for the Public IP of App Gateway"
}
variable "app_gateway_name" {
  description = "Name for the Application Gateway"
}
variable "beap_name" {
  description = "BackEnd Address Pool Name"
}
variable "beap_url" {
  description = "URL of the BackEnd Address Pool"
}
