
resource "azurerm_resource_group" "rg-block" {
  name = "rg1"
  location = "eastus"
}

resource "azurerm_storage_account" "storage-block" {
  name = "bmwacct0305"
  location = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}