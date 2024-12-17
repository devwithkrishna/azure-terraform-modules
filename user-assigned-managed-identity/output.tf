output "id_of_user_assigned_managed_identity" {
  value       = azurerm_user_assigned_identity.managed_identity.id
  description = "Id of the user assigned managed identity"
}

output "client_id_of_user_assigned_managed_identity" {
  value       = azurerm_user_assigned_identity.managed_identity.client_id
  description = "Id of the service principal associated to the Identity"
}

output "principal_id_of_user_assigned_managed_identity" {
  value       = azurerm_user_assigned_identity.managed_identity.principal_id
  description = "Id of the service principal associated with the managed identity"
}

output "tenanat_id_of_user_assigned_managed_identity" {
  value       = azurerm_user_assigned_identity.managed_identity.tenant_id
  description = "Id of the tenant in which managed identity is created"
}
