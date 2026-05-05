
output "storageacct-name" {
    value = azurerm_storage_account.storage-block.name
    description = "This output variable is used to get storage account name"
}

output "storageacct-id" {
    value = azurerm_storage_account.storage-block.id
    description = "This output variable is used to get storage account id"
}