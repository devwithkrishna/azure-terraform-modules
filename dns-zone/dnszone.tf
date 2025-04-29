resource "azurerm_resource_group" "dns_rg" {
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

resource "azurerm_dns_zone" "dns" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.dns_rg.name

  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.dns_zone_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }

  depends_on = [azurerm_resource_group.dns_rg]
}