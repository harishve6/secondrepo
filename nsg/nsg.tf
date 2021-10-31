resource "azurerm_network_security_group" "appgw_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  security_rule {
    name                       = "AllowAzureInfra"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "65200-65535"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "AllowWebTraffic"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443"]
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
}
