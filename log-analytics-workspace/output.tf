output "loganalytics_workspace_name" {
  value = azurerm_log_analytics_workspace.loganalytics_ws.name
  description = "Azure Log analytics workspace name"
}

output "loganalytics_workspace_resource_group" {
  value = azurerm_log_analytics_workspace.loganalytics_ws.resource_group_name
    description = "Azure Log analytics workspace resource group name"
}

output "loganalytics_retention_period" {
  value = azurerm_log_analytics_workspace.loganalytics_ws.retention_in_days
  description = "Azure loganalytics data retention in days"
}

output "loganalytics_sku" {
  value = azurerm_log_analytics_workspace.loganalytics_ws.sku
  description = "Azure loganalytics SKU"
}
