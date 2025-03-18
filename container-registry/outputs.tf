output "container_registry_name" {
  description = "Azure container registry name"
  value       = azurerm_container_registry.acr.name
}

output "acr_rg" {
  description = "Azure container registry RG"
  value       = azurerm_resource_group.acr_rg.name
}

output "acr_login_server" {
  description = "The URL that can be used to log into the container registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_enabled" {
  description = "Admin user is enabled for acr or not"
  value       = azurerm_container_registry.acr.admin_enabled
}

output "acr_admin_username" {
  description = "Username associated with the Container Registry Admin account - if the admin account is enabled"
  value       = azurerm_container_registry.acr.admin_username
  depends_on  = [azurerm_container_registry.acr]
}

output "acr_admin_password" {
  description = " Password associated with the Container Registry Admin account - if the admin account is enabled"
  value       = nonsensitive(azurerm_container_registry.acr.admin_password)
  depends_on  = [azurerm_container_registry.acr]
  sensitive   = false
}

output "acr_anonymous_pull_enabled" {
  description = "Anonymous pull is enabled on ACR or not"
  value       = azurerm_container_registry.acr.anonymous_pull_enabled
}
