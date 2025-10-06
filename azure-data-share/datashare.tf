resource "azurerm_resource_group" "datashare" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}


resource "azurerm_data_share_account" "datashare" {
  name                = var.data_share_name
  location            = azurerm_resource_group.datashare.location
  resource_group_name = azurerm_resource_group.datashare.name


  # Usiny System Assigned Managed Identity
  identity {
    type = "SystemAssigned"
  }

  # https://github.com/Azure/azure-rest-api-specs/issues/9280

  # tags = azurerm_resource_group.datashare.tags

}