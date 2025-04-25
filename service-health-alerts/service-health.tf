


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
  scopes              = [each.value.subscription_id]
  description         = "Service Health Alert for ${each.value.category}"

  criteria {
    category = each.value.category
    levels   = ["Critical", "Error", "Warning", "Informational", "Verbose"]
    statuses = ["Started", "Failed", "Succeeded"]
  }
  action {
    action_group_id = var.use_existing_action_group ? data.azurerm_monitor_action_group.existing[*].id : azurerm_monitor_action_group.action_group[*].id
  }
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.service_health_alert_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}

