resource "azurerm_servicebus_namespace" "asb-namespace" {
  name                = var.sb_namespace_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "asb-queue" {
  name                = var.sb_queue_name
  resource_group_name = var.resourcegroup_name
  namespace_name      = var.sb_namespace
  enable_partitioning = true
}