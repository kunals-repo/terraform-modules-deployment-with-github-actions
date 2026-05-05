
resource "azurerm_resource_group" "storage-rg" {
  name = "storage-rg"
  location = "eastus" 
}

module "storageacct1" {
    source = "./Modules/StorageAcct"
    rg-name = azurerm_resource_group.storage-rg.name
    rg-location = azurerm_resource_group.storage-rg.location
    storage-name = var.storage-name
    replication-type = var.replication-type
}
module "storageacct1-container1" {
  source = "./Modules/Containers"
  container-name = var.container-name
  storageaccount-id = module.storageacct1.storageacct-id
}
module "storageacct1-container1-blob1" {
  source = "./Modules/Blobs"
  blob-name = var.blob-name
  storageacct-name = module.storageacct1.storageacct-name
  container-name = module.storageacct1-container1.container-name
  blob-source = var.blob-source
}

module "storageacct2" {
    source = "./Modules/StorageAcct"
    rg-name = azurerm_resource_group.storage-rg.name
    rg-location = azurerm_resource_group.storage-rg.location
    storage-name = var.storage-name2
    replication-type = var.replication-type2
}