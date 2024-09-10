<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.1 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Optional variables
      	 additional_data_disks  = []
      	 additional_data_disks_storage_account_type  = "Standard_LRS"
      	 admin_username  = "admin_user"
      	 application_name  = ""
      	 backend_port  = 80
      	 default_instance_count  = 0
      	 environment  = ""
      	 eviction_policy  = "Delete"
      	 frontend_port  = 80
      	 load_balancer_sku  = "Basic"
      	 location  = ""
      	 os_disk_size  = 30
      	 os_disk_storage_account_type  = "Standard_LRS"
      	 priority  = ""
      	 protocol  = "Http"
      	 request_path  = "/"
      	 resource_group_name  = ""
      	 sku_size  = ""
      	 subnet_name  = ""
      	 vmss_name  = ""
      	 vnet_name  = ""
      	 vnet_resource_group  = ""
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_address_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.health](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine_scale_set.vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_public_ip.lb_pub_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [local_file.cloudinit](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_additional_data_disks"></a> [additional_data_disks](#input_additional_data_disks) | Adding additional disks capacity to add each instance in GB | `list(number)` | no |
| <a name="input_additional_data_disks_storage_account_type"></a> [additional_data_disks_storage_account_type](#input_additional_data_disks_storage_account_type) | The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, Premium_LRS and UltraSSD_LRS. | `string` | no |
| <a name="input_admin_username"></a> [admin_username](#input_admin_username) | VMSS default user name | `string` | no |
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_backend_port"></a> [backend_port](#input_backend_port) | Port on which traffic is passed on to application backends | `number` | no |
| <a name="input_default_instance_count"></a> [default_instance_count](#input_default_instance_count) | Default instance count for the VMSS | `number` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_eviction_policy"></a> [eviction_policy](#input_eviction_policy) | Azure Spot VM eviction policy Delete or Deallocate | `string` | no |
| <a name="input_frontend_port"></a> [frontend_port](#input_frontend_port) | Port on which queries for status of application | `number` | no |
| <a name="input_load_balancer_sku"></a> [load_balancer_sku](#input_load_balancer_sku) | Azure Loadbalancer Skus | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location | `string` | no |
| <a name="input_os_disk_size"></a> [os_disk_size](#input_os_disk_size) | OS disk size in GB | `number` | no |
| <a name="input_os_disk_storage_account_type"></a> [os_disk_storage_account_type](#input_os_disk_storage_account_type) | OS disk storage account type | `string` | no |
| <a name="input_priority"></a> [priority](#input_priority) | Type of vmss instances Spot or regular | `string` | no |
| <a name="input_protocol"></a> [protocol](#input_protocol) | Protocol for Load balancing | `string` | no |
| <a name="input_request_path"></a> [request_path](#input_request_path) | Health check path | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure VMSS resource group name | `string` | no |
| <a name="input_sku_size"></a> [sku_size](#input_sku_size) | Azure VMSS sku | `string` | no |
| <a name="input_subnet_name"></a> [subnet_name](#input_subnet_name) | Azure subnet name to create vmss | `string` | no |
| <a name="input_vmss_name"></a> [vmss_name](#input_vmss_name) | Azure VMSS name | `string` | no |
| <a name="input_vnet_name"></a> [vnet_name](#input_vnet_name) | Azure Vnet Name | `string` | no |
| <a name="input_vnet_resource_group"></a> [vnet_resource_group](#input_vnet_resource_group) | Azure Vnet resource group | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin_password](#output_admin_password) | VMSS user password |
| <a name="output_admin_username"></a> [admin_username](#output_admin_username) | VMSS user name |
| <a name="output_azure_vmss_name"></a> [azure_vmss_name](#output_azure_vmss_name) | Azure VMSS name |
| <a name="output_azure_vmss_rg"></a> [azure_vmss_rg](#output_azure_vmss_rg) | Azure VMSS Rg |
| <a name="output_data_disks"></a> [data_disks](#output_data_disks) | VMSS data disks |
| <a name="output_load_balancer_frontend_public_ip"></a> [load_balancer_frontend_public_ip](#output_load_balancer_frontend_public_ip) | Azure load balancer frontend ip address |
| <a name="output_loadbalancer_id"></a> [loadbalancer_id](#output_loadbalancer_id) | AzureLoad balancer Id |
| <a name="output_os_disk"></a> [os_disk](#output_os_disk) | VMSS os disk size |
| <a name="output_subnet_id"></a> [subnet_id](#output_subnet_id) | Azure Subnet id |
| <a name="output_type_of_instances"></a> [type_of_instances](#output_type_of_instances) | Spot or Regular instances |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->