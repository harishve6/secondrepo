resource "azurerm_subnet" "bastion-subnet" {
  name                 = var.subnetname
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_space
}
