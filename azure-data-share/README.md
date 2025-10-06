<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | <= 4.0 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 data_share_name  = ""
      	 environment  = "DEV"
      	 location  = ""
      	 resource_group_name  = ""
      	 temporary  = "TRUE"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_data_share_account.datashare](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_share_account) | resource |
| [azurerm_resource_group.datashare](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_data_share_name"></a> [data_share_name](#input_data_share_name) | Azure Data Share name | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure data share location | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Data Share Rg | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_datashare_rg"></a> [azure_datashare_rg](#output_azure_datashare_rg) | value of the resource group |
| <a name="output_datashare_id"></a> [datashare_id](#output_datashare_id) | value of the data share account id |
| <a name="output_datashare_name"></a> [datashare_name](#output_datashare_name) | value of the data share account |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->