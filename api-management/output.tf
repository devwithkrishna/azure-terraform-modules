output "azure_resource_group_name" {
  description = "Azure resource group name"
  value = azurerm_resource_group.rg.name
}

output "azure_api_management_name" {
  description = "Azure API management name"
  value = azurerm_api_management.apim.name
}

output "azure_api_management_location" {
  description = "Azure API management location"
  value = azurerm_api_management.apim.location
}

output "azure_api_management_publisher_name" {
  description = "Azure API management"
  value = azurerm_api_management.apim.publisher_name
}

output "azure_api_management_publisher_emailids" {
  description = "Azure API management publisher emails"
  value = azurerm_api_management.apim.publisher_email
}

output "azure_api_management_sku" {
  description = "Azure API management SKU"
  value = azurerm_api_management.apim.sku_name
}