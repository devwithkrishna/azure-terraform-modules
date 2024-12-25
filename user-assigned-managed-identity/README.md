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
      	 environment  = "DEV"
      	 location  = ""
      	 managed_identity_name  = ""
      	 resource_group_name  = ""
      	 temporary  = ""
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_user_assigned_identity.managed_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag value | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location | `string` | no |
| <a name="input_managed_identity_name"></a> [managed_identity_name](#input_managed_identity_name) | Name of user assigned managed identity in Azure | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure resource group name to create managed identity | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id_of_user_assigned_managed_identity"></a> [client_id_of_user_assigned_managed_identity](#output_client_id_of_user_assigned_managed_identity) | Id of the service principal associated to the Identity |
| <a name="output_id_of_user_assigned_managed_identity"></a> [id_of_user_assigned_managed_identity](#output_id_of_user_assigned_managed_identity) | Id of the user assigned managed identity |
| <a name="output_principal_id_of_user_assigned_managed_identity"></a> [principal_id_of_user_assigned_managed_identity](#output_principal_id_of_user_assigned_managed_identity) | Id of the service principal associated with the managed identity |
| <a name="output_tenanat_id_of_user_assigned_managed_identity"></a> [tenanat_id_of_user_assigned_managed_identity](#output_tenanat_id_of_user_assigned_managed_identity) | Id of the tenant in which managed identity is created |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->