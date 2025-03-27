<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | <= 4.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.1 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Required variables
      	 keyvault_name  = 
      	 resource_group_name  = 
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 azure_disk_encryption_can_retrieve_secrets  = false
      	 azure_resource_manager_can_retrieve_secrets  = false
      	 azure_vms_can_access_certs_stored_as_secrets  = false
      	 enable_rbac_authorization  = false
      	 environment  = "DEV"
      	 location  = ""
      	 public_network_access_enabled  = true
      	 purge_protection_enabled  = false
      	 sku_name  = "standard"
      	 soft_delete_retention_days  = 90
<<<<<<< HEAD
      	 temporary  = "TRUE"
=======
      	 subnet_name  = ""
      	 temporary  = "TRUE"
      	 virtual_network_name  = ""
      	 virtual_network_rg  = "value"
>>>>>>> 9f01a6de8a1b593be03e99a3f8dca7b9c915b405
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
<<<<<<< HEAD
| [azurerm_resource_group.keyvault_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
=======
| [azurerm_private_dns_a_record.pvt_dns_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_endpoint.pvt_end_pt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.keyvault_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_private_dns_zone.key_vault_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_subnet.pvt_end_pt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
>>>>>>> 9f01a6de8a1b593be03e99a3f8dca7b9c915b405

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_azure_disk_encryption_can_retrieve_secrets"></a> [azure_disk_encryption_can_retrieve_secrets](#input_azure_disk_encryption_can_retrieve_secrets) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys | `bool` | no |
| <a name="input_azure_resource_manager_can_retrieve_secrets"></a> [azure_resource_manager_can_retrieve_secrets](#input_azure_resource_manager_can_retrieve_secrets) | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the vault | `bool` | no |
| <a name="input_azure_vms_can_access_certs_stored_as_secrets"></a> [azure_vms_can_access_certs_stored_as_secrets](#input_azure_vms_can_access_certs_stored_as_secrets) | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault | `bool` | no |
| <a name="input_enable_rbac_authorization"></a> [enable_rbac_authorization](#input_enable_rbac_authorization) | Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions | `bool` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_keyvault_name"></a> [keyvault_name](#input_keyvault_name) | Azure keyvault name | `string` | yes |
| <a name="input_location"></a> [location](#input_location) | Azure keyvault location | `string` | no |
| <a name="input_public_network_access_enabled"></a> [public_network_access_enabled](#input_public_network_access_enabled) | Whether public network access is allowed for this Key Vault | `bool` | no |
| <a name="input_purge_protection_enabled"></a> [purge_protection_enabled](#input_purge_protection_enabled) | Purge Protection enabled or not | `bool` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure keyvault Rg | `string` | yes |
| <a name="input_sku_name"></a> [sku_name](#input_sku_name) | Keyvault SKUs available in azure. Valid options are standard and premium | `string` | no |
| <a name="input_soft_delete_retention_days"></a> [soft_delete_retention_days](#input_soft_delete_retention_days) | The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 | `number` | no |
<<<<<<< HEAD
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |
=======
| <a name="input_subnet_name"></a> [subnet_name](#input_subnet_name) | Name of the subnet in which private endpoint will be created | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |
| <a name="input_virtual_network_name"></a> [virtual_network_name](#input_virtual_network_name) | Name of the virtual network in which private endpoint will be created | `string` | no |
| <a name="input_virtual_network_rg"></a> [virtual_network_rg](#input_virtual_network_rg) | Virtual network resource group | `string` | no |
>>>>>>> 9f01a6de8a1b593be03e99a3f8dca7b9c915b405

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_resource_group"></a> [azurerm_resource_group](#output_azurerm_resource_group) | Azure resource group name |
| <a name="output_enable_rbac_authorization"></a> [enable_rbac_authorization](#output_enable_rbac_authorization) | Azure kv RBAC access enabled or not |
| <a name="output_enabled_for_deployment"></a> [enabled_for_deployment](#output_enabled_for_deployment) | Azure vms can access certs from kv |
| <a name="output_enabled_for_disk_encryption"></a> [enabled_for_disk_encryption](#output_enabled_for_disk_encryption) | Azure disk encryption can access keys from keyvault or not |
| <a name="output_enabled_for_template_deployment"></a> [enabled_for_template_deployment](#output_enabled_for_template_deployment) | Azure resource manager can access secrets or not |
| <a name="output_keyvault_location"></a> [keyvault_location](#output_keyvault_location) | Azure keyvault location |
| <a name="output_keyvault_name"></a> [keyvault_name](#output_keyvault_name) | Azure keyvault name |
| <a name="output_keyvault_sku"></a> [keyvault_sku](#output_keyvault_sku) | Azure Keyvault SKu |
<<<<<<< HEAD
=======
| <a name="output_privat_enedpoint_ipaddress"></a> [privat_enedpoint_ipaddress](#output_privat_enedpoint_ipaddress) | Azure kv private endpoint address |
>>>>>>> 9f01a6de8a1b593be03e99a3f8dca7b9c915b405
| <a name="output_public_access_enabled"></a> [public_access_enabled](#output_public_access_enabled) | Azure kv enabled public access or not |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->