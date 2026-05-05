
resource "azurerm_storage_blob" "blob-block" {
  name                   = var.blob-name
  storage_account_name   = var.storageacct-name
  storage_container_name = var.container-name
  type                   = "Block"
  source                 = var.blob-source
}