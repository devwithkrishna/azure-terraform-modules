resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
  }
}

resource "azurerm_log_analytics_workspace" "loganalytics_ws" {
  name = var.loganalytics_workspace_name
  sku = var.loganalytics_sku
  resource_group_name = var.resource_group_name
  location = var.location
  retention_in_days = var.loganalytics_retention_period
}
