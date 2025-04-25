output "resource_group" {
  description = "Azure data factory resource group name"
  value       = azurerm_resource_group.data_factory_rg.name
}

output "data_factory_name" {
  description = "Azure Data Factory name"
  value       = azurerm_data_factory.data_factory.name
}

output "data_factory_location" {
  description = "Azure data factory location"
  value       = azurerm_data_factory.data_factory.location
}

output "public_access_enabled" {
  description = "Azure datafactory enabled public access or not"
  value       = azurerm_data_factory.data_factory.public_network_enabled
}