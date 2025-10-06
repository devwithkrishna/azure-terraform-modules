<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | <= 4.0 |
| <a name="requirement_time"></a> [time](#requirement_time) | >= 0.9.1 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 data_share_name  = ""
      	 datashare_terms  = "Data share terms of use."
      	 environment  = "DEV"
      	 location  = ""
      	 resource_group_name  = ""
      	 share_description  = ""
      	 share_name  = ""
      	 share_type  = "CopyBased"
      	 snapshot_recurrence  = ""
      	 snapshot_schedule_name  = ""
      	 snapshot_start_time  = null
      	 temporary  = "TRUE"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_data_share.datashare](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_share) | resource |
| [azurerm_data_share_account.datashare](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_share_account) | resource |
| [azurerm_resource_group.datashare](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_data_share_name"></a> [data_share_name](#input_data_share_name) | Azure Data Share name | `string` | no |
| <a name="input_datashare_terms"></a> [datashare_terms](#input_datashare_terms) | The terms of the Data Share. | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure data share location | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Data Share Rg | `string` | no |
| <a name="input_share_description"></a> [share_description](#input_share_description) | Data share Description | `string` | no |
| <a name="input_share_name"></a> [share_name](#input_share_name) | Data share - Share's name | `string` | no |
| <a name="input_share_type"></a> [share_type](#input_share_type) | Data share - Share's type | `string` | no |
| <a name="input_snapshot_recurrence"></a> [snapshot_recurrence](#input_snapshot_recurrence) | The recurrence of the snapshot schedule. | `string` | no |
| <a name="input_snapshot_schedule_name"></a> [snapshot_schedule_name](#input_snapshot_schedule_name) | The name of the snapshot schedule. | `string` | no |
| <a name="input_snapshot_start_time"></a> [snapshot_start_time](#input_snapshot_start_time) | The start time of the snapshot schedule in UTC format (e.g., '2023-10-01T00:00:00Z'). If not provided, it defaults to one hour from the current time. This should be in RFC 3389 format. | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_datashare_rg"></a> [azure_datashare_rg](#output_azure_datashare_rg) | value of the resource group |
| <a name="output_datashare_id"></a> [datashare_id](#output_datashare_id) | value of the data share account id |
| <a name="output_datashare_name"></a> [datashare_name](#output_datashare_name) | value of the data share account |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->