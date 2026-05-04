
resource "azurerm_resource_group" "rg-block" {
  name     = "VMs-rg"
  location = "southindia"
}


resource "azurerm_virtual_network" "vnet-block" {
  for_each = var.vm-creation
  name                = each.value.vnet
  address_space       = [each.value.vnet_ip]
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
}

resource "azurerm_subnet" "subnet-block" {
  for_each = var.vm-creation
  name                 = each.value.subnet
  resource_group_name  = azurerm_resource_group.rg-block.name
  virtual_network_name = azurerm_virtual_network.vnet-block[each.key].name
  address_prefixes     = [each.value.subnet_ip]
}

resource "azurerm_network_interface" "nic-block" {
  for_each = var.vm-creation
  name                = each.value.nic_name
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-block[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm-block" {
  for_each = var.vm-creation
  name                = each.value.vm_name
  resource_group_name = azurerm_resource_group.rg-block.name
  location            = azurerm_resource_group.rg-block.location
  size                = "Standard_D2s_v3"
  admin_username      = "kunal"
  admin_password      = each.value.vm_password
  network_interface_ids = [
    azurerm_network_interface.nic-block[each.key].id,
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

