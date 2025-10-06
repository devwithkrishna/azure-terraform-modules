output "azure_datashare_rg" {
  description = "value of the resource group"
  value       = azurerm_resource_group.datashare.name
}

output "datashare_name" {
  description = "value of the data share account"
  value       = azurerm_data_share_account.datashare.name
}

output "datashare_id" {
  description = "value of the data share account id"
  value       = azurerm_data_share_account.datashare.id

}
