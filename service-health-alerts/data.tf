# list all subscriptions
data "azurerm_subscriptions" "available" {
}


data "azurerm_monitor_action_group" "existing" {
  count               = var.use_existing_action_group ? length(var.action_group_name) : 0
  name                = var.action_group_name[count.index]
  resource_group_name = var.existing_action_group_rg
}