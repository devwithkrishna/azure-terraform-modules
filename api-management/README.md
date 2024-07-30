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

| Name | Type |
|------|------|
| [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_api_management_name"></a> [api_management_name](#input_api_management_name) | Azure api management name | `string` | yes |
| <a name="input_location"></a> [location](#input_location) | Azure storage account location | `string` | yes |
| <a name="input_publisher_email"></a> [publisher_email](#input_publisher_email) | Email ID of API publishers | `list(string)` | yes |
| <a name="input_publisher_name"></a> [publisher_name](#input_publisher_name) | Publisher of API | `list(string)` | yes |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Storage Account Rg | `string` | yes |
| <a name="input_sku_name_part1"></a> [sku_name_part1](#input_sku_name_part1) | SKU name of API management | `string` | yes |
| <a name="input_sku_name_part2"></a> [sku_name_part2](#input_sku_name_part2) | Sku capacity part | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_api_management_location"></a> [azure_api_management_location](#output_azure_api_management_location) | Azure API management location |
| <a name="output_azure_api_management_name"></a> [azure_api_management_name](#output_azure_api_management_name) | Azure API management name |
| <a name="output_azure_api_management_publisher_emailids"></a> [azure_api_management_publisher_emailids](#output_azure_api_management_publisher_emailids) | Azure API management publisher emails |
| <a name="output_azure_api_management_publisher_name"></a> [azure_api_management_publisher_name](#output_azure_api_management_publisher_name) | Azure API management |
| <a name="output_azure_api_management_sku"></a> [azure_api_management_sku](#output_azure_api_management_sku) | Azure API management SKU |
| <a name="output_azure_resource_group_name"></a> [azure_resource_group_name](#output_azure_resource_group_name) | Azure resource group name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->