data "azurerm_client_config" "current" {
}

# data "azurerm_subnet" "service_cidr" {
#   name                 = var.service_cidr_subnet_name
#   virtual_network_name = var.virtual_network_name
#   resource_group_name  = var.virtual_netwok_rg
# }

data "azuread_groups" "cluster_admin" {
  display_names = [for group in var.cluster_admin_group_names : group]
}

data "azuread_service_principal" "sp" {
  client_id = data.azurerm_key_vault_secret.appid.value
}

data "azurerm_subnet" "vnet_subnet_cidr" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_netwok_rg
}

data "azurerm_subscription" "primary" {
}

data "azurerm_key_vault" "existing" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg_name
}

data "azurerm_key_vault_secret" "secret" {
  name         = "AKS-SP-PASSWORD"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "appid" {
  name         = "AKS-SP-APPID"
  key_vault_id = data.azurerm_key_vault.existing.id
}