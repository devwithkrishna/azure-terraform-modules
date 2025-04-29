output "resource_group" {
  description = "Azure DNS Zone resource group name"
  value       = azurerm_resource_group.dns_rg.name
}

output "dns_zone_name" {
  description = "Azure DNS zone name"
  value       = azurerm_dns_zone.dns.name
}

output "resource_group_location" {
  description = "Azure resource group location"
  value       = azurerm_resource_group.dns_rg.location
}

output "dns_zone_id" {
  description = "DNS zone ID"
  value       = azurerm_dns_zone.dns.i

}

output "name_servers" {
  description = "Name servers for the DNS zone"
  value       = azurerm_dns_zone.dns.name_servers

}