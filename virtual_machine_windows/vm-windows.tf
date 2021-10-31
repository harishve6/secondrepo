# Network Interface
resource "azurerm_network_interface" "vm-windows-nic" {
  name                = var.vm_nic_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm-subnet-id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machine - Windows

resource "azurerm_windows_virtual_machine" "vm_windows" {
  name                = var.vm_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.vm-windows-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_SSD"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  tags = {
    env     = var.env
  }
}
