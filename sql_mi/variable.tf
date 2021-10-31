variable "resourcegroup_name" {
  description = "Name of the Resource Group"
}
variable "location" {
  description = "Location of the SQL managed instance"
}
variable "sqlmi_name" {
  description = "Name for the SQL managed instance"
}
variable "db_subnet_id" {
  description = "database subnet ID"
}
variable "db_subnet_nsg_association" {
  description = "database subnet NSG association"
}
variable "db_subnet_route_table" {
  description = "database subnet route table association"
}