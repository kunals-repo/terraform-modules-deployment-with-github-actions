
resource "azurerm_resource_group" "rg-block" {
  name     = "vm-rg"
  location = "West US 2"
}

resource "azurerm_virtual_network" "vnet-block" {
  name                = "vnet1"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
}

resource "azurerm_subnet" "subnet-block" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg-block.name
  virtual_network_name = azurerm_virtual_network.vnet-block.name
  address_prefixes     = ["10.0.0.0/25"]
}

resource "azurerm_network_interface" "nic-block" {
  name                = "nic-card"
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-block.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm-block" {
  name                = "vm1"
  resource_group_name = azurerm_resource_group.rg-block.name
  location            = azurerm_resource_group.rg-block.location
  size                = "Standard_D2s_v3"
  admin_username      = "kunal"
  admin_password      = "Colors@2021"
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