
resource "azurerm_storage_account" "storage-block" {
  name                     = var.storage-name
  resource_group_name      = var.rg-name
  location                 = var.rg-location
  account_tier             = "Premium"
  account_replication_type = var.replication-type
  account_kind             = "BlockBlobStorage"

}