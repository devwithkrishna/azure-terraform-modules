resource "azurerm_resource_group" "acr_rg" {
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


resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  sku                 = var.sku_name

  dynamic "georeplications" {
    for_each = var.georeplications
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = var.sku_name == "Premium" ? georeplications.value.zone_redundancy_enabled : false
      tags = {
        Environment     = upper(var.environment)
        Orchestrator    = "Terraform"
        DisplayName     = "replication-${upper(var.container_registry_name)}"
        ApplicationName = lower(var.application_name)
        Temporary       = upper(var.temporary)
      }
    }
  }

  retention_policy_in_days      = var.sku_name == "Premium" ? var.container_registry_config.retention_policy_in_days : null
  public_network_access_enabled = var.container_registry_config.public_network_access_enabled
  quarantine_policy_enabled     = var.sku_name == "Premium" ? var.container_registry_config.quarantine_policy_enabled : false
  zone_redundancy_enabled       = var.sku_name == "Premium" ? var.container_registry_config.zone_redundancy_enabled : false
  admin_enabled                 = var.container_registry_config.admin_enabled
  anonymous_pull_enabled        = var.sku_name != "Basic" ? var.container_registry_config.anonymous_pull_enabled : false
  data_endpoint_enabled         = var.sku_name == "Premium" ? var.container_registry_config.data_endpoint_enabled : false
  trust_policy_enabled          = var.sku_name == "Premium" ? var.container_registry_config.trust_policy_enabled : false

  network_rule_bypass_option = var.azure_services_bypass
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.container_registry_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}