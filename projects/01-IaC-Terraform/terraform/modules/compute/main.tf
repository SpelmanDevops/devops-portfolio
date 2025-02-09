resource "azurerm_linux_virtual_machine" "web" {
    name                = "web-vm"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = "Standard_B1ls"
    admin_username      = "adminuser"

    network_interface_ids  = [azurerm_network_interface.web.nic.id]
    
    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer = "UbuntuServer"
      sku = "18.04-LTS"
      version = "latest"
    }
}

resource "azurerm_network_interface" "web_nic" {
    name                = "web-nic"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
      name                          = "internal"
      subnet_id                     = azurerm_subnet.web_subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}