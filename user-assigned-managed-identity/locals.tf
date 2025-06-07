# Unified local to refer to the selected RG
locals {
  resource_group_name = var.create_in_existing_resource_group ? data.azurerm_resource_group.existing[0].name : azurerm_resource_group.rg[0].name
}
