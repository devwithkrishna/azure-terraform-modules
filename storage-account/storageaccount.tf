resource "azurerm_resource_group" "storage_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment = upper(var.environment)
    Orchestrator = "Terraform"
    DisplayName = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.storage_rg.name
  location                 = azurerm_resource_group.storage_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind = var.account_kind
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  public_network_access_enabled = var.public_network_access_enabled

  blob_properties {
    delete_retention_policy {
      days = var.delete_retention_policy
    }
  }

  tags = {
    Environment = upper(var.environment)
    Orchestrator = "Terraform"
    DisplayName = upper(var.storage_account_name)
    ApplicationName = lower(var.application_name)
  }
}