<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_management_name"></a> [api\_management\_name](#input\_api\_management\_name) | Azure api management name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure storage account location | `string` | `"centralindia"` | no |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | Email ID of API publishers | `list(string)` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | Publisher of API | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure Storage Account Rg | `string` | n/a | yes |
| <a name="input_sku_name_part1"></a> [sku\_name\_part1](#input\_sku\_name\_part1) | SKU name of API management | `string` | n/a | yes |
| <a name="input_sku_name_part2"></a> [sku\_name\_part2](#input\_sku\_name\_part2) | Sku capacity part | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure-api-management-location"></a> [azure-api-management-location](#output\_azure-api-management-location) | n/a |
| <a name="output_azure-api-management-name"></a> [azure-api-management-name](#output\_azure-api-management-name) | n/a |
| <a name="output_azure-api-management-publisher-emailids"></a> [azure-api-management-publisher-emailids](#output\_azure-api-management-publisher-emailids) | n/a |
| <a name="output_azure-api-management-publisher-name"></a> [azure-api-management-publisher-name](#output\_azure-api-management-publisher-name) | n/a |
| <a name="output_azure-api-management-sku"></a> [azure-api-management-sku](#output\_azure-api-management-sku) | n/a |
| <a name="output_azure-resource-group-name"></a> [azure-resource-group-name](#output\_azure-resource-group-name) | n/a |
<!-- END_TF_DOCS -->
<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Required variables
      	 api_management_name  = 
      	 location  = 
      	 publisher_email  = 
      	 publisher_name  = 
      	 resource_group_name  = 
      	 sku_name_part1  = 
      	 sku_name_part2  = 
    }
  ```

## Resources

The following resources are used by this module:

- [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) (resource)
- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_api_management_name"></a> [api_management_name](#input_api_management_name)

Description: Azure api management name

Type: `string`

### <a name="input_location"></a> [location](#input_location)

Description: Azure storage account location

Type: `string`

### <a name="input_publisher_email"></a> [publisher_email](#input_publisher_email)

Description: Email ID of API publishers

Type: `list(string)`

### <a name="input_publisher_name"></a> [publisher_name](#input_publisher_name)

Description: Publisher of API

Type: `list(string)`

### <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)

Description: Azure Storage Account Rg

Type: `string`

### <a name="input_sku_name_part1"></a> [sku_name_part1](#input_sku_name_part1)

Description: SKU name of API management

Type: `string`

### <a name="input_sku_name_part2"></a> [sku_name_part2](#input_sku_name_part2)

Description: Sku capacity part

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_azure_api_management_location"></a> [azure_api_management_location](#output_azure_api_management_location)

Description: Azure API management location

### <a name="output_azure_api_management_name"></a> [azure_api_management_name](#output_azure_api_management_name)

Description: Azure API management name

### <a name="output_azure_api_management_publisher_emailids"></a> [azure_api_management_publisher_emailids](#output_azure_api_management_publisher_emailids)

Description: Azure API management publisher emails

### <a name="output_azure_api_management_publisher_name"></a> [azure_api_management_publisher_name](#output_azure_api_management_publisher_name)

Description: Azure API management

### <a name="output_azure_api_management_sku"></a> [azure_api_management_sku](#output_azure_api_management_sku)

Description: Azure API management SKU

### <a name="output_azure_resource_group_name"></a> [azure_resource_group_name](#output_azure_resource_group_name)

Description: Azure resource group name
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->