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
      
	 # Required variables
      	 container_registry_config  = 
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 azure_services_bypass  = "AzureServices"
      	 container_registry_name  = ""
      	 environment  = "DEV"
      	 georeplications  = []
      	 location  = ""
      	 resource_group_name  = ""
      	 sku_name  = "Basic"
      	 temporary  = "TRUE"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_resource_group.acr_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_azure_services_bypass"></a> [azure_services_bypass](#input_azure_services_bypass) | Whether to allow trusted Azure services to access a network restricted Container Registry? Possible values are None and AzureServices. Defaults to AzureServices | `string` | no |
| <a name="input_container_registry_config"></a> [container_registry_config](#input_container_registry_config) | Manages an Azure Container Registry | ```object({ admin_enabled = optional(bool) quarantine_policy_enabled = optional(bool) zone_redundancy_enabled = optional(bool) public_network_access_enabled = optional(bool) retention_policy_in_days = optional(number) trust_policy_enabled = optional(bool) anonymous_pull_enabled = optional(bool) data_endpoint_enabled = optional(bool) })``` | yes |
| <a name="input_container_registry_name"></a> [container_registry_name](#input_container_registry_name) | Azure container registry name | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_georeplications"></a> [georeplications](#input_georeplications) | A list of Azure locations where the container registry should be geo-replicated | ```list(object({ location = string zone_redundancy_enabled = optional(bool) }))``` | no |
| <a name="input_location"></a> [location](#input_location) | Azure container registry location | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure container registry Rg | `string` | no |
| <a name="input_sku_name"></a> [sku_name](#input_sku_name) | Container registry SKUs available in Azure. Valid options are Basic, Standard or Premium | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_admin_enabled"></a> [acr_admin_enabled](#output_acr_admin_enabled) | Admin user is enabled for acr or not |
| <a name="output_acr_admin_password"></a> [acr_admin_password](#output_acr_admin_password) | Password associated with the Container Registry Admin account - if the admin account is enabled |
| <a name="output_acr_admin_username"></a> [acr_admin_username](#output_acr_admin_username) | Username associated with the Container Registry Admin account - if the admin account is enabled |
| <a name="output_acr_anonymous_pull_enabled"></a> [acr_anonymous_pull_enabled](#output_acr_anonymous_pull_enabled) | Anonymous pull is enabled on ACR or not |
| <a name="output_acr_login_server"></a> [acr_login_server](#output_acr_login_server) | The URL that can be used to log into the container registry |
| <a name="output_acr_rg"></a> [acr_rg](#output_acr_rg) | Azure container registry RG |
| <a name="output_container_registry_name"></a> [container_registry_name](#output_container_registry_name) | Azure container registry name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->