# current user / service principal details
data "azurerm_client_config" "current" {
}

# get admin group details
data "azuread_groups" "cluster_admin" {
  display_names = [for group in var.cluster_admin_group_names : group]
}

# get sp app id from kv
data "azuread_service_principal" "sp" {
  client_id = data.azurerm_key_vault_secret.appid.value
}

# get subnet id for nodepool
data "azurerm_subnet" "vnet_subnet_cidr" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_netwok_rg
}

# get subscription id
data "azurerm_subscription" "primary" {
}

# get kv details
data "azurerm_key_vault" "existing" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg_name
}

# get sp app id from kv
data "azurerm_key_vault_secret" "secret" {
  name         = "AKS-SP-PASSWORD"
  key_vault_id = data.azurerm_key_vault.existing.id
}

# get sp app secret from kv
data "azurerm_key_vault_secret" "appid" {
  name         = "AKS-SP-APPID"
  key_vault_id = data.azurerm_key_vault.existing.id
}