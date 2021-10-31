resource "azurerm_sql_managed_instance" "sqlmi" {
  name                         = var.sqlmi_name
  resource_group_name          = var.resourcegroup_name
  location                     = var.location
  administrator_login          = "administrator"
  administrator_login_password = "thisIsDog11"
  license_type                 = "BasePrice"
  subnet_id                    = var.db_subnet_id
  sku_name                     = "GP_Gen5"
  vcores                       = 8
  storage_size_in_gb           = 256
  collation                    = "SQL_Latin1_General_CP1_CI_AS"
  minimum_tls_version          = 1.2
  timezone_id                  = "utc"
  proxy_override               = "proxy"

  depends_on = [
    var.db_subnet_nsg_association,
    var.db_subnet_route_table,
  ]
}