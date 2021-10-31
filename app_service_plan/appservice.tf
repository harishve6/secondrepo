resource "azurerm_app_service_plan" "asp" {
  name                = var.appservice_plan_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  sku {
    tier = "Premium"
    size = "P1"
  }
}