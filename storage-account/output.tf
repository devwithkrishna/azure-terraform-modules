output "azurerm_resource_group" {
  value = azurerm_resource_group.storage_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_location" {
  value = azurerm_storage_account.storage.location
}

output "storage_account_delete_retention_policy" {
  value = azurerm_storage_account.storage.blob_properties[0].delete_retention_policy
}

output "storage_account_tier" {
  value = azurerm_storage_account.storage.access_tier
}

output "storage_account_replication_type" {
  value = azurerm_storage_account.storage.account_replication_type
}

output "storage_account_tags" {
  value = azurerm_storage_account.storage.tags
}