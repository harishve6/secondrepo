# Network Interface
resource "azurerm_network_interface" "vm-linux-nic" {
  name                = var.vm_nic_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
# Virtual Machine - LINUX

resource "azurerm_linux_virtual_machine" "vm-linux" {
  name                = var.vm_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_username
  network_interface_ids = [
    azurerm_network_interface.vm-linux-nic.id,
  ]

  admin_ssh_key {
    username   = var.vm_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
