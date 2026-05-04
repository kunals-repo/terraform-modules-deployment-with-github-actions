
resource "azurerm_resource_group" "rg-block" {
  name     = "vmrg"
  location = "eastus"
}


resource "azurerm_virtual_network" "vnet-block" {
  name                = var.vnet-name
  address_space       = [var.vnet-ip]
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
}

resource "azurerm_subnet" "subnet-block" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.rg-block.name
  virtual_network_name = azurerm_virtual_network.vnet-block.name
  address_prefixes     = [var.subnet-ip]
}

resource "azurerm_network_interface" "nic-block" {
  name                = var.nic-name
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-block.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm-block" {

  name                = var.vm-name
  resource_group_name = azurerm_resource_group.rg-block.name
  location            = azurerm_resource_group.rg-block.location
  size                = "Standard_DS1_v2"
  admin_username      = "kunal"
  admin_password      = var.vm-password
  network_interface_ids = [
    azurerm_network_interface.nic-block.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

