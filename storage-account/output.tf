output "azurerm_resource_group" {
  description = "Azure resource group name"
  value = azurerm_resource_group.storage_rg.name
}

output "storage_account_name" {
  description = "Azure storage account name"
  value = azurerm_storage_account.storage.name
}

output "storage_account_location" {
  description = "Azure storage account location"
  value = azurerm_storage_account.storage.location
}

output "storage_account_delete_retention_policy" {
  description = "Azure blob retention policy"
  value = azurerm_storage_account.storage.blob_properties[0].delete_retention_policy
}

output "storage_account_tier" {
  description = "Azure storage account tier"
  value = azurerm_storage_account.storage.access_tier
}

output "storage_account_replication_type" {
  description = "Azure storage account replication type"
  value = azurerm_storage_account.storage.account_replication_type
}

output "storage_account_tags" {
  description = "Azure storage account tags"
  value = azurerm_storage_account.storage.tags
}