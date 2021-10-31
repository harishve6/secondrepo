# application gateway subnet

resource "azurerm_subnet" "appgw_subnet" {
  name                 = var.appgw_subnet_name
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.appgw_subnet_addr
}

# network security group for application gateway subnet

resource "azurerm_network_security_group" "appgw_nsg" {
  name                = var.appgw_nsg
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

# Assigning Network security group to application gatewaysubnet

resource "azurerm_subnet_network_security_group_association" "nsg_appgwsubnet_link" {
  subnet_id                 = azurerm_subnet.appgw_subnet.id
  network_security_group_id = azurerm_network_security_group.appgw_nsg.id
}

# public ip creation

resource "azurerm_public_ip" "appgw_pip" {
  name                = var.appgw_pip_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  allocation_method   = "Dynamic"
}

# Application Gateway

resource "azurerm_application_gateway" "adv_app_gw" {
  name                = var.app_gateway_name
  resource_group_name = var.resourcegroup_name
  location            = var.location

  sku {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = 1
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_type    = "OWASP"
    rule_set_version = "3.0"
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.appgw_subnet.id
  }

  frontend_port {
    name = "AppGW_frontend_port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "AppGW_frontend_IP"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  backend_address_pool {
    name  = var.beap_name
    fqdns = [var.beap_url]
  }

  probe {
    name                = "probe_1"
    protocol            = "http"
    path                = "/"
    host                = "${var.host_name}"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  backend_http_settings {
    name                  = "be_http"
    cookie_based_affinity = "Disabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    #path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    probe_name            = "probe_1"
  }

  http_listener {
    name                           = "http_lstn"
    frontend_ip_configuration_name = "AppGW_frontend_IP"
    frontend_port_name             = "AppGW_frontend_port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "req_routing_rule"
    rule_type                  = "Basic"
    http_listener_name         = "http_lstn"
    backend_address_pool_name  = var.beap_name
    backend_http_settings_name = "be_http"
  }
}
