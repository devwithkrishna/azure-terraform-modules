<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | >= 4.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.1 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 dns_zone_name  = ""
      	 environment  = "DEV"
      	 location  = ""
      	 resource_group_name  = ""
      	 temporary  = "TRUE"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_resource_group.dns_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_dns_zone_name"></a> [dns_zone_name](#input_dns_zone_name) | Azure DNS Zone name | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure DNS RG location | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure DNS Zone Rg | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_zone_id"></a> [dns_zone_id](#output_dns_zone_id) | DNS zone ID |
| <a name="output_dns_zone_name"></a> [dns_zone_name](#output_dns_zone_name) | Azure DNS zone name |
| <a name="output_name_servers"></a> [name_servers](#output_name_servers) | Name servers for the DNS zone |
| <a name="output_resource_group"></a> [resource_group](#output_resource_group) | Azure DNS Zone resource group name |
| <a name="output_resource_group_location"></a> [resource_group_location](#output_resource_group_location) | Azure resource group location |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->