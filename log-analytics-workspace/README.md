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
      	 application_name  = ""
      	 environment  = ""
      	 location  = ""
      	 loganalytics_retention_period  = 7
      	 loganalytics_sku  = "PerGB2018"
      	 loganalytics_workspace_name  = ""
      	 resource_group_name  = ""
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.loganalytics_ws](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location | `string` | no |
| <a name="input_loganalytics_retention_period"></a> [loganalytics_retention_period](#input_loganalytics_retention_period) | Loganalytics logs retention period | `number` | no |
| <a name="input_loganalytics_sku"></a> [loganalytics_sku](#input_loganalytics_sku) | Specifies the SKU of the Log Analytics Workspace | `string` | no |
| <a name="input_loganalytics_workspace_name"></a> [loganalytics_workspace_name](#input_loganalytics_workspace_name) | Loganalytics workspace name | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure resource group name to create log analytics workspace | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_loganalytics_retention_period"></a> [loganalytics_retention_period](#output_loganalytics_retention_period) | Azure loganalytics data retention in days |
| <a name="output_loganalytics_sku"></a> [loganalytics_sku](#output_loganalytics_sku) | Azure loganalytics SKU |
| <a name="output_loganalytics_workspace_name"></a> [loganalytics_workspace_name](#output_loganalytics_workspace_name) | Azure Log analytics workspace name |
| <a name="output_loganalytics_workspace_resource_group"></a> [loganalytics_workspace_resource_group](#output_loganalytics_workspace_resource_group) | Azure Log analytics workspace resource group name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->