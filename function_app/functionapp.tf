resource "azurerm_function_app" "function-app" {
  name                       = "${var.project}-${var.env}-function"
  location                   = var.location
  resource_group_name        = var.resourcegroup_name
  app_service_plan_id        = var.appservice_plan_id
  storage_account_name       = var.storageaccount_name
  storage_account_access_key = var.sa_primary_access_key
}