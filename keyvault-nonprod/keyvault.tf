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
  name                             = var.keyvault_name
  resource_group_name              = azurerm_resource_group.keyvault_rg.name
  location                         = azurerm_resource_group.keyvault_rg.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = var.sku_name

  enable_rbac_authorization = var.enable_rbac_authorization
  enabled_for_deployment = var.azure_vms_can_access_certs_stored_as_secrets
  enabled_for_disk_encryption = var.azure_disk_encryption_can_retrieve_secrets
  enabled_for_template_deployment = var.azure_resource_manager_can_retrieve_secrets

  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  public_network_access_enabled = var.public_network_access_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    
    key_permissions = [
      "Get", "List", "Create", "Recover", "Purge", "UnwrapKey", "Update", "WrapKey", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
    ]

    secret_permissions = [
      "Get","Set", "List", "Delete", "Recover"
    ]

    storage_permissions = [
      "Get", "Delete", "List", "Recover", "RegenerateKey","Restore","Set" , "SetSAS", "Update"
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