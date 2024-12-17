resource "azurerm_resource_group" "rg" {
  name     = upper(var.resource_group_name)
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}

resource "azurerm_user_assigned_identity" "managed_identity" {
  name                = upper(var.managed_identity_name)
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}
