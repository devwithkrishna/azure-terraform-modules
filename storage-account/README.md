<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.1 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Required variables
      	 resource_group_name  = 
      	 storage_account_name  = 
      
	 # Optional variables
      	 account_kind  = "StorageV2"
      	 account_replication_type  = "LRS"
      	 account_tier  = "Standard"
      	 application_name  = "devwithkrishna"
      	 cross_tenant_replication_enabled  = false
      	 delete_retention_policy  = 10
      	 environment  = "DEV"
      	 location  = ""
      	 public_network_access_enabled  = true
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.storage_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_account_kind"></a> [account_kind](#input_account_kind) | Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2 | `string` | no |
| <a name="input_account_replication_type"></a> [account_replication_type](#input_account_replication_type) | type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS | `string` | no |
| <a name="input_account_tier"></a> [account_tier](#input_account_tier) | Tier to use for this storage account. Valid options are Standard and Premium | `string` | no |
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_cross_tenant_replication_enabled"></a> [cross_tenant_replication_enabled](#input_cross_tenant_replication_enabled) | Should cross Tenant replication be enabled | `bool` | no |
| <a name="input_delete_retention_policy"></a> [delete_retention_policy](#input_delete_retention_policy) | Specifies the number of days that the blob should be retained | `number` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure storage account location | `string` | no |
| <a name="input_public_network_access_enabled"></a> [public_network_access_enabled](#input_public_network_access_enabled) | Whether the public network access is enabled | `bool` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Storage Account Rg | `string` | yes |
| <a name="input_storage_account_name"></a> [storage_account_name](#input_storage_account_name) | Azure Storage Account name | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_resource_group"></a> [azurerm_resource_group](#output_azurerm_resource_group) | Azure resource group name |
| <a name="output_storage_account_delete_retention_policy"></a> [storage_account_delete_retention_policy](#output_storage_account_delete_retention_policy) | Azure blob retention policy |
| <a name="output_storage_account_location"></a> [storage_account_location](#output_storage_account_location) | Azure storage account location |
| <a name="output_storage_account_name"></a> [storage_account_name](#output_storage_account_name) | Azure storage account name |
| <a name="output_storage_account_replication_type"></a> [storage_account_replication_type](#output_storage_account_replication_type) | Azure storage account replication type |
| <a name="output_storage_account_tags"></a> [storage_account_tags](#output_storage_account_tags) | Azure storage account tags |
| <a name="output_storage_account_tier"></a> [storage_account_tier](#output_storage_account_tier) | Azure storage account tier |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->