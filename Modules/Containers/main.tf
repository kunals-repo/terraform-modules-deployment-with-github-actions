
resource "azurerm_storage_container" "container-block" {
  name                  = var.container-name
  storage_account_id    = var.storageaccount-id
  container_access_type = "private"

}