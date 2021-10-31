variable "apimanagement_name" {
  description = "Name of the API management"
}
variable "resourcegroup_name" {
  description = "Name of the Resource Group"
}
variable "location" {
  description = "Location for the API management"
}
variable "vnet_name" {
  description = "Name of the Virtual Network"
}
variable "apim_subnet_name" {
  description = "Name for the API management subnet"
}
variable "apim_subnet_cidr" {
  description = "CIDR address space for APIM subnet"
}
variable "apim_backend_name" {
  description = "Name of the backend for API management"
}
variable "apim_backend_url" {
  description = "URL of the backend in the API management"
}
