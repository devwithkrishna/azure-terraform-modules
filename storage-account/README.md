<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement_terraform) (~> 1.3)

- <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) (~> 3.0)

- <a name="requirement_random"></a> [random](#requirement_random) (>= 3.1)
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
      	 location  = "centralindia"
      	 public_network_access_enabled  = true
    }
  ```

## Resources

The following resources are used by this module:

- [azurerm_resource_group.storage_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)
- [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)

Description: Azure Storage Account Rg

Type: `string`

### <a name="input_storage_account_name"></a> [storage_account_name](#input_storage_account_name)

Description: Azure Storage Account name

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_account_kind"></a> [account_kind](#input_account_kind)

Description: Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2

Type: `string`

### <a name="input_account_replication_type"></a> [account_replication_type](#input_account_replication_type)

Description: type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS

Type: `string`

### <a name="input_account_tier"></a> [account_tier](#input_account_tier)

Description: Tier to use for this storage account. Valid options are Standard and Premium

Type: `string`

### <a name="input_application_name"></a> [application_name](#input_application_name)

Description: Azure application name tag

Type: `string`

### <a name="input_cross_tenant_replication_enabled"></a> [cross_tenant_replication_enabled](#input_cross_tenant_replication_enabled)

Description: Should cross Tenant replication be enabled

Type: `bool`

### <a name="input_delete_retention_policy"></a> [delete_retention_policy](#input_delete_retention_policy)

Description: Specifies the number of days that the blob should be retained

Type: `number`

### <a name="input_environment"></a> [environment](#input_environment)

Description: Environment tag value in Azure

Type: `string`

### <a name="input_location"></a> [location](#input_location)

Description: Azure storage account location

Type: `string`

### <a name="input_public_network_access_enabled"></a> [public_network_access_enabled](#input_public_network_access_enabled)

Description: Whether the public network access is enabled

Type: `bool`

## Outputs

The following outputs are exported:

### <a name="output_azurerm_resource_group"></a> [azurerm_resource_group](#output_azurerm_resource_group)

Description: Azure resource group name

### <a name="output_storage_account_delete_retention_policy"></a> [storage_account_delete_retention_policy](#output_storage_account_delete_retention_policy)

Description: Azure blob retention policy

### <a name="output_storage_account_location"></a> [storage_account_location](#output_storage_account_location)

Description: Azure storage account location

### <a name="output_storage_account_name"></a> [storage_account_name](#output_storage_account_name)

Description: Azure storage account name

### <a name="output_storage_account_replication_type"></a> [storage_account_replication_type](#output_storage_account_replication_type)

Description: Azure storage account replication type

### <a name="output_storage_account_tags"></a> [storage_account_tags](#output_storage_account_tags)

Description: Azure storage account tags

### <a name="output_storage_account_tier"></a> [storage_account_tier](#output_storage_account_tier)

Description: Azure storage account tier
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->