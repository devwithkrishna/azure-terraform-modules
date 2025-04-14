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
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 data_factory_name  = ""
      	 environment  = "DEV"
      	 location  = ""
      	 managed_virtual_network_enabled  = "true"
      	 public_network_enabled  = "true"
      	 resource_group_name  = ""
      	 temporary  = "TRUE"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.data_factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |
| [azurerm_resource_group.data_factory_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_data_factory_name"></a> [data_factory_name](#input_data_factory_name) | Azure Data factory name | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure Data factory location | `string` | no |
| <a name="input_managed_virtual_network_enabled"></a> [managed_virtual_network_enabled](#input_managed_virtual_network_enabled) | Is Managed Virtual Network enabled | `string` | no |
| <a name="input_public_network_enabled"></a> [public_network_enabled](#input_public_network_enabled) | Is Public Network enabled | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Datafactory Rg | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_location"></a> [data_factory_location](#output_data_factory_location) | Azure data factory location |
| <a name="output_data_factory_name"></a> [data_factory_name](#output_data_factory_name) | Azure Data Factory name |
| <a name="output_public_access_enabled"></a> [public_access_enabled](#output_public_access_enabled) | Azure datafactory enabled public access or not |
| <a name="output_resource_group"></a> [resource_group](#output_resource_group) | Azure data factory resource group name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->