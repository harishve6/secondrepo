resource "azurerm_resource_group" "resourcegroup" {
  name = var.resourcegroup_name
  location = var.location
}
