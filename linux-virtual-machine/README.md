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
      	 environment  = "DEV"
      	 eviction_policy  = "Delete"
      	 location  = "centralindia"
      	 os_disk_size  = 32
      	 priority  = ""
      	 public_ip_address_name  = "JENKINS-DOCKERHOST-PUBLIC-IP"
      	 resource_group_name  = "JENKINS-DOCKEHOST-RG"
      	 source_image_reference  = {
  "offer": "0001-com-ubuntu-server-jammy",
  "publisher": "Canonical",
  "sku": "22_04-lts",
  "version": "latest"
}
      	 subnet_name  = "ARCHITECTS-PROTECTED-CI-SUBNET"
      	 temporary  = "TRUE"
      	 vm_sku  = "Standard_D2as_v4"
      	 vmname  = "JENKINS-DOCKERHOST-VM"
      	 vnet_name  = "ARCHITECTS-CENTRAL-INDIA-VNET"
      	 vnet_rg  = "ARCHITECTS-CENTRAL-INDIA-VNET-RG"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_pet.vm_username](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [template_cloudinit_config.config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_eviction_policy"></a> [eviction_policy](#input_eviction_policy) | Azure Spot VM eviction policy Delete or Deallocate | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location where VM is deployed | `string` | no |
| <a name="input_os_disk_size"></a> [os_disk_size](#input_os_disk_size) | OS disk size in GB | `number` | no |
| <a name="input_priority"></a> [priority](#input_priority) | Type of vmss instances Spot or regular | `string` | no |
| <a name="input_public_ip_address_name"></a> [public_ip_address_name](#input_public_ip_address_name) | Public IP address name | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure resource group name | `string` | no |
| <a name="input_source_image_reference"></a> [source_image_reference](#input_source_image_reference) | Source image reference for the virtual machine | ```object({ publisher = string offer = string sku = string version = string })``` | no |
| <a name="input_subnet_name"></a> [subnet_name](#input_subnet_name) | Subnet name where VM will be attached | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |
| <a name="input_vm_sku"></a> [vm_sku](#input_vm_sku) | Azure virtual machine SKU | `string` | no |
| <a name="input_vmname"></a> [vmname](#input_vmname) | Azure virtual machine name | `string` | no |
| <a name="input_vnet_name"></a> [vnet_name](#input_vnet_name) | Virtual network name where VM will be attached | `string` | no |
| <a name="input_vnet_rg"></a> [vnet_rg](#input_vnet_rg) | Virtual network resource group name | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_location"></a> [location](#output_location) | Location of the resource |
| <a name="output_public_ip_address"></a> [public_ip_address](#output_public_ip_address) | Public IP address of the VM |
| <a name="output_public_ip_address_name"></a> [public_ip_address_name](#output_public_ip_address_name) | Public IP address name |
| <a name="output_resource_group_name"></a> [resource_group_name](#output_resource_group_name) | Resource group name |
| <a name="output_subnet_name"></a> [subnet_name](#output_subnet_name) | Subnet used for the VM |
| <a name="output_virtul_machine_name"></a> [virtul_machine_name](#output_virtul_machine_name) | Virtual machine name |
| <a name="output_vm_private_ip"></a> [vm_private_ip](#output_vm_private_ip) | Private IP address of the VM |
| <a name="output_vm_sku"></a> [vm_sku](#output_vm_sku) | Azure VM SKU |
| <a name="output_vm_user_name"></a> [vm_user_name](#output_vm_user_name) | value of the username |
| <a name="output_vm_user_password"></a> [vm_user_password](#output_vm_user_password) | value of the password |
| <a name="output_vnet_name"></a> [vnet_name](#output_vnet_name) | Virtual Network used for the VM |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->