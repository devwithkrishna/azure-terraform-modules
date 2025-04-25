resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.action_group_name
  enabled             = true

  dynamic "email_receiver" {
    #  count = var.email_action_type ? length(var.email_action_type) : 0
    for_each = var.email_action_type ? var.email_address : []
    content {
      name          = "${EmailReceiver}-${email_receiver.key}"
      email_address = email_receiver.value
    }

  }

  dynamic "azure_app_push_receiver" {
    # count = var.azure_push_action_type ? length(var.azure_push_action_type) : 0
    for_each = var.azure_push_action_type ? var.email_address : []
    content {
      name          = "${AzureAppPushReceiver}-${azure_app_push_receiver.key}"
      email_address = azure_app_push_receiver.value
    }

  }
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.action_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }

}
