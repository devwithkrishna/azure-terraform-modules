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
  lifecycle {
    ignore_changes = [tags] 
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
  lifecycle {
    ignore_changes = [tags] 
  }

}


resource "azurerm_data_share" "datashare" {
  name        = var.share_name
  account_id  = azurerm_data_share_account.datashare.id
  kind        = var.share_type
  description = var.share_description
  terms       = var.datashare_terms

  snapshot_schedule {
    name       = var.snapshot_schedule_name
    recurrence = var.snapshot_recurrence
    start_time = local.computed_start_time
  }

  lifecycle {
    ignore_changes = [tags] 
  }
}
