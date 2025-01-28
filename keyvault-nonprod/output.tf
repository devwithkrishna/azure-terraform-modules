output "azurerm_resource_group" {
  description = "Azure resource group name"
  value       = azurerm_resource_group.keyvault_rg
}

output "keyvault_name" {
  description = "Azure keyvault name"
  value       = azurerm_key_vault.kv.name
}

output "keyvault_location" {
  description = "Azure keyvault location"
  value       = azurerm_key_vault.kv.location
}

output "keyvault_sku" {
  description = "Azure Keyvault SKu"
  value       = azurerm_key_vault.kv.sku_name
}

output "enable_rbac_authorization" {
  description = "Azure kv RBAC access enabled or not"
  value       = azurerm_key_vault.kv.enable_rbac_authorization
}

output "enabled_for_deployment" {
  description = "Azure vms can access certs from kv"
  value       = azurerm_key_vault.kv.enabled_for_deployment
}

output "enabled_for_disk_encryption" {
  description = "Azure disk encryption can access keys from keyvault or not"
  value       = azurerm_key_vault.kv.enabled_for_disk_encryption
}

output "enabled_for_template_deployment" {
  description = "Azure resource manager can access secrets or not"
  value       = azurerm_key_vault.kv.enabled_for_template_deployment
}
output "public_access_enabled" {
  description = "Azure kv enabled public access or not"
  value       = azurerm_key_vault.kv.public_network_access_enabled
}