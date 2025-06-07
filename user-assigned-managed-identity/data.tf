# Use existing resource group when not creating new one
data "azurerm_resource_group" "existing" {
  count = var.create_in_existing_resource_group ? 1 : 0
  name  = var.resource_group_name
}