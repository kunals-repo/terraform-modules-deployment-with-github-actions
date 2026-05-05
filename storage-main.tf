
resource "azurerm_resource_group" "storage-rg" {
  name = "Storage-rg"
  location = "centralus" 
}

module "storageacct1" {
    source = "./Modules/StorageAcct"
    rg-name = azurerm_resource_group.storage-rg.name
    rg-location = azurerm_resource_group.storage-rg.location
    storage-name = var.storage-name
    replication-type = var.replication-type
  
}