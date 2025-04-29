
resource "azurerm_resource_group" "rg" {
  count    = var.use_exisiting_rg ? 0 : 1
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}


# Resource: Azure Monitor Service Health Alert
resource "azurerm_monitor_activity_log_alert" "alert" {
  for_each = {
    for combo in setproduct(
      data.azurerm_subscriptions.available.subscriptions[*].subscription_id,
      var.service_health_categories
    ) :
    "${combo[0]}-${combo[1]}" => {
      subscription_id = combo[0]
      category        = combo[1]
    }
  }

  name                = "${var.service_health_alert_name}-${each.value.category}"
  resource_group_name = var.resource_group_name
  location            = var.location
  scopes              = ["/subscriptions/${each.value.subscription_id}"] # Prepend '/subscriptions/' to the subscription ID
  description         = "Service Health Alert for ${each.value.category}"

  criteria {
    category = each.value.category
    levels   = ["Critical", "Error", "Warning", "Informational", "Verbose"]
    statuses = ["Started", "Failed", "Succeeded"]
  }
  action {
    # Dynamically pass all action group IDs
    action_group_id = var.use_existing_action_group ? join(",", data.azurerm_monitor_action_group.existing[*].id) : join(",", [for ag in azurerm_monitor_action_group.action_group : ag.id])
  }
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.service_health_alert_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}

