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
      	 application_name  = ""
      	 environment  = ""
      	 location  = ""
      	 resource_group_name  = ""
      	 subnet_cidrs  = []
      	 vnet_address_space  = []
      	 vnet_name  = ""
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.port22](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.port4243](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.port80](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.port8080](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.subnet2nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Vnet resource group name | `string` | no |
| <a name="input_subnet_cidrs"></a> [subnet_cidrs](#input_subnet_cidrs) | Azure Subnet Ip addresses | `list(string)` | no |
| <a name="input_vnet_address_space"></a> [vnet_address_space](#input_vnet_address_space) | Azure VNET address space | `list(string)` | no |
| <a name="input_vnet_name"></a> [vnet_name](#input_vnet_name) | Azure Vnet name | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_location"></a> [location](#output_location) | Azure Location |
| <a name="output_network_security_group_id"></a> [network_security_group_id](#output_network_security_group_id) | Azure NSG ID |
| <a name="output_resource_group_name"></a> [resource_group_name](#output_resource_group_name) | Azure resource group name |
| <a name="output_subnet_ids"></a> [subnet_ids](#output_subnet_ids) | List of all subnet IDs |
| <a name="output_vnet_address_range"></a> [vnet_address_range](#output_vnet_address_range) | Azure Vnet address range |
| <a name="output_vnet_name"></a> [vnet_name](#output_vnet_name) | Azure Virtual network name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->