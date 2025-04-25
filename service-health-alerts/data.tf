# list all subscriptions
data "azurerm_subscriptions" "available" {
}


# Fetch all action groups if needed
# data "azurerm_monitor_action_group" "existing" {
#   count               = var.use_existing_action_group ? length(var.use_existing_action_group) : 0
#   for_each = {
#     for index, action_group_name in var.use_existing_action_group :
#       "${action_group_name}-${var.existing_action_group_rg[index]}" => {
#         action_group_name = action_group_name
#         resource_group_name = var.existing_action_group_rg[index]
#       }
#   }

#   name                = each.value.action_group_name
#   resource_group_name = each.value.resource_group_name

# }

data "azurerm_monitor_action_group" "existing" {
  count               = var.use_existing_action_group ? length(var.action_group_name) : 0
  name                = var.action_group_name[count.index]
  resource_group_name = var.existing_action_group_rg[count.index]
}