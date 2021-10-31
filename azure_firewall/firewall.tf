resource "azurerm_subnet" "firewall-subnet" {
  name                 = var.firewall_subnet_name
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.firewall_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
  service_endpoints = [ "Microsoft.Storage" , "Microsoft.KeyVault","Microsoft.sql" ]
}

resource "azurerm_public_ip" "firewall-pip" {
  name                = var.firewall_pip_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewallname
  location            = var.location
  resource_group_name = var.resourcegroup_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall-subnet.id
    public_ip_address_id = azurerm_public_ip.firewall-pip.id
  }

resource "azurerm_firewall_policy" "firewall-policy" {
  name                = var.firewall_policy_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  threat_intelligence_mode = "Alert"
 }    
}
