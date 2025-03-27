resource "azurerm_resource_group" "keyvault_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}

resource "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  resource_group_name = azurerm_resource_group.keyvault_rg.name
  location            = azurerm_resource_group.keyvault_rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name

  enable_rbac_authorization       = var.enable_rbac_authorization
  enabled_for_deployment          = var.azure_vms_can_access_certs_stored_as_secrets
  enabled_for_disk_encryption     = var.azure_disk_encryption_can_retrieve_secrets
  enabled_for_template_deployment = var.azure_resource_manager_can_retrieve_secrets

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  public_network_access_enabled = var.public_network_access_enabled

  depends_on = [ azurerm_resource_group.keyvault_rg ]
  network_acls {
    bypass = "AzureServices" # Specifies which traffic can bypass the network rules
    default_action = "Deny"  # Specifies the default action when no rule from ip_rules and virtual_network_subnet_ids match
    virtual_network_subnet_ids = [data.azurerm_subnet.pvt_end_pt.id] # List of subnet ids that can access the key vault
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Recover", "Purge", "UnwrapKey", "Update", "WrapKey", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete", "Recover"
    ]

    storage_permissions = [
      "Get", "Delete", "List", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
    ]

    certificate_permissions = [
      "Create", "Delete", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageIssuers", "SetIssuers", "Update"
    ]

  }

  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.keyvault_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}


resource "azurerm_private_endpoint" "pvt_end_pt" {
  name                = "${var.keyvault_name}-pvt-end-pt"
  location            = azurerm_resource_group.keyvault_rg.location
  resource_group_name = azurerm_resource_group.keyvault_rg.name
  subnet_id           = data.azurerm_subnet.pvt_end_pt.id
  custom_network_interface_name = "${var.keyvault_name}-pvt-end-pt-nic"
  
  depends_on = [ azurerm_key_vault.kv, azurerm_resource_group.keyvault_rg ]

  private_service_connection {
      name                           = lower("${azurerm_key_vault.kv.name}-psc")
      private_connection_resource_id = azurerm_key_vault.kv.id
      is_manual_connection           = false
      subresource_names              = ["Vault"]
    }

  private_dns_zone_group {
    name                 = "privatelink.vaultcore.azure.net"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.key_vault_dns_zone.id]
  }

}