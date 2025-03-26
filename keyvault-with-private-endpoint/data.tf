data "azurerm_client_config" "current" {}

data "azurerm_subnet" "pvt_end_pt" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_rg
}

data "azurerm_private_dns_zone" "key_vault_dns_zone" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = "ARCHITECTS-CENTRAL-INDIA-AKS-VNET-RG"
}