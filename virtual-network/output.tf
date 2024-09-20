output "resource_group_name" {
  value = azurerm_resource_group.rg.name
  description = "Azure resource group name"
}

output "location" {
  description = "Azure Location"
  value = azurerm_resource_group.rg.location
}

output "vnet_name" {
  description = "Azure Virtual network name"
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_range" {
  description = "Azure Vnet address range"
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_ids" {
  description = "List of all subnet IDs"
  value       = azurerm_subnet.example_subnet[*].id  # Collect all subnet IDs
}

output "network_security_group_id" {
  description = "Azure NSG ID"
  value = azurerm_network_security_group.nsg.id
}

