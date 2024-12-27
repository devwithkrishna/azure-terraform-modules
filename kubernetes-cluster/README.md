<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | <= 4.14.0 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Optional variables
      	 aks_cluster_name  = ""
      	 aks_node_resource_group_name  = ""
      	 application_name  = ""
      	 automatic_upgrade_channel  = ""
      	 cluster_admin_group_names  = [
  ""
]
      	 default_nodepool_autoscaling  = true
      	 default_nodepool_max_count  = 1
      	 default_nodepool_min_count  = 1
      	 default_nodepool_name  = "agentpool"
      	 default_nodepool_sku  = "Standard_D2ps_v5"
      	 enable_blob_driver  = true
      	 enable_disk_driver  = true
      	 enable_fileshare_driver  = true
      	 environment  = ""
      	 key_vault_secrets_provider  = true
      	 keyvault_name  = ""
      	 keyvault_rg_name  = ""
      	 kubernetes_sku_tier  = ""
      	 kubernetes_version  = "1.30.4"
      	 load_balancer_sku  = ""
      	 location  = ""
      	 max_pods_per_node  = 100
      	 network_plugin  = "azure"
      	 network_plugin_mode  = "overlay"
      	 network_policy  = "azure"
      	 node_public_ip_enabled  = false
      	 os_disk_size_in_gb  = 32
      	 os_sku  = "Ubuntu"
      	 pod_cidr_range  = "172.0.0.0/16"
      	 private_cluster  = false
      	 resource_group_name  = ""
      	 secret_rotation_interval  = "1m"
      	 service_cidr_subnet  = "192.168.0.0/16"
      	 subnet_name  = ""
      	 support_plan  = "KubernetesOfficial"
      	 temporary  = ""
      	 virtual_netwok_rg  = ""
      	 virtual_network_name  = ""
      	 worker_node_scaledown_mode  = "Deallocate"
      	 worker_node_spot  = true
      	 worker_nodepool_autoscaling  = true
      	 worker_nodepool_eviction_policy  = "Deallocate"
      	 worker_nodepool_max_count  = 5
      	 worker_nodepool_min_count  = 0
      	 worker_nodepool_mode  = "User"
      	 worker_nodepool_name  = "workernodes"
      	 worker_nodepool_sku  = "Standard_D2ads_v5"
      	 workload_identity_enabled  = true
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.workernodes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azuread_groups.cluster_admin](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/groups) | data source |
| [azuread_service_principal.sp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.existing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.appid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_subnet.vnet_subnet_cidr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aks_cluster_name"></a> [aks_cluster_name](#input_aks_cluster_name) | Name of Aks cluster in Azure | `string` | no |
| <a name="input_aks_node_resource_group_name"></a> [aks_node_resource_group_name](#input_aks_node_resource_group_name) | Azure node resource group name | `string` | no |
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag value | `string` | no |
| <a name="input_automatic_upgrade_channel"></a> [automatic_upgrade_channel](#input_automatic_upgrade_channel) | The upgrade channel for this Kubernetes Cluster | `string` | no |
| <a name="input_cluster_admin_group_names"></a> [cluster_admin_group_names](#input_cluster_admin_group_names) | Name of Azure AD groups to provide cluster admin permissions. | `list(string)` | no |
| <a name="input_default_nodepool_autoscaling"></a> [default_nodepool_autoscaling](#input_default_nodepool_autoscaling) | Enable auto scaling in default nodepool | `bool` | no |
| <a name="input_default_nodepool_max_count"></a> [default_nodepool_max_count](#input_default_nodepool_max_count) | Maximum number of nodes in default nodepool | `number` | no |
| <a name="input_default_nodepool_min_count"></a> [default_nodepool_min_count](#input_default_nodepool_min_count) | Minimum number of nodes in default nodepool | `number` | no |
| <a name="input_default_nodepool_name"></a> [default_nodepool_name](#input_default_nodepool_name) | System nodepool for cluster | `string` | no |
| <a name="input_default_nodepool_sku"></a> [default_nodepool_sku](#input_default_nodepool_sku) | Aks system node pool | `string` | no |
| <a name="input_enable_blob_driver"></a> [enable_blob_driver](#input_enable_blob_driver) | Enable Blob CSI driver enabled | `bool` | no |
| <a name="input_enable_disk_driver"></a> [enable_disk_driver](#input_enable_disk_driver) | Enable Disk CSI driver enabled | `bool` | no |
| <a name="input_enable_fileshare_driver"></a> [enable_fileshare_driver](#input_enable_fileshare_driver) | Enable Fileshare CSI driver enabled | `bool` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_key_vault_secrets_provider"></a> [key_vault_secrets_provider](#input_key_vault_secrets_provider) | Should the secret store CSI driver on the AKS cluster be enabled | `bool` | no |
| <a name="input_keyvault_name"></a> [keyvault_name](#input_keyvault_name) | Azure Key Vault name | `string` | no |
| <a name="input_keyvault_rg_name"></a> [keyvault_rg_name](#input_keyvault_rg_name) | Azure Key Vault rg name | `string` | no |
| <a name="input_kubernetes_sku_tier"></a> [kubernetes_sku_tier](#input_kubernetes_sku_tier) | SKU Tier that should be used for this Kubernetes Cluster | `string` | no |
| <a name="input_kubernetes_version"></a> [kubernetes_version](#input_kubernetes_version) | Kubernetes version in AKS cluster | `string` | no |
| <a name="input_load_balancer_sku"></a> [load_balancer_sku](#input_load_balancer_sku) | Load balancer SKu | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location | `string` | no |
| <a name="input_max_pods_per_node"></a> [max_pods_per_node](#input_max_pods_per_node) | maximum number of pods that can be accumulated in a node | `number` | no |
| <a name="input_network_plugin"></a> [network_plugin](#input_network_plugin) | Azure CNI network plugin | `string` | no |
| <a name="input_network_plugin_mode"></a> [network_plugin_mode](#input_network_plugin_mode) | Specifies the network plugin mode used for building the Kubernetes network | `string` | no |
| <a name="input_network_policy"></a> [network_policy](#input_network_policy) | Azure networ policy to be used with CNI cluster | `string` | no |
| <a name="input_node_public_ip_enabled"></a> [node_public_ip_enabled](#input_node_public_ip_enabled) | Should each node have a Public IP Address | `bool` | no |
| <a name="input_os_disk_size_in_gb"></a> [os_disk_size_in_gb](#input_os_disk_size_in_gb) | OS disk size | `number` | no |
| <a name="input_os_sku"></a> [os_sku](#input_os_sku) | AKS node pool image | `string` | no |
| <a name="input_pod_cidr_range"></a> [pod_cidr_range](#input_pod_cidr_range) | CIDR range for pods | `string` | no |
| <a name="input_private_cluster"></a> [private_cluster](#input_private_cluster) | Deploy AKS cluster without exposing publically accessible endpoint | `bool` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure resource group name to create aks cluster | `string` | no |
| <a name="input_secret_rotation_interval"></a> [secret_rotation_interval](#input_secret_rotation_interval) | The interval to poll for secret rotation | `string` | no |
| <a name="input_service_cidr_subnet"></a> [service_cidr_subnet](#input_service_cidr_subnet) | Azure service cidr subnet | `string` | no |
| <a name="input_subnet_name"></a> [subnet_name](#input_subnet_name) | Azure subnet name | `string` | no |
| <a name="input_support_plan"></a> [support_plan](#input_support_plan) | Specifies the support plan which should be used for this Kubernetes Cluster | `string` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |
| <a name="input_virtual_netwok_rg"></a> [virtual_netwok_rg](#input_virtual_netwok_rg) | Azure Vnet resource group | `string` | no |
| <a name="input_virtual_network_name"></a> [virtual_network_name](#input_virtual_network_name) | Azure Vnet name | `string` | no |
| <a name="input_worker_node_scaledown_mode"></a> [worker_node_scaledown_mode](#input_worker_node_scaledown_mode) | Specifies how the node pool should deal with scaled-down nodes | `string` | no |
| <a name="input_worker_node_spot"></a> [worker_node_spot](#input_worker_node_spot) | Worker nodes are spot or ondemand | `bool` | no |
| <a name="input_worker_nodepool_autoscaling"></a> [worker_nodepool_autoscaling](#input_worker_nodepool_autoscaling) | Enable auto scaling in worker nodepool | `bool` | no |
| <a name="input_worker_nodepool_eviction_policy"></a> [worker_nodepool_eviction_policy](#input_worker_nodepool_eviction_policy) | Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool | `string` | no |
| <a name="input_worker_nodepool_max_count"></a> [worker_nodepool_max_count](#input_worker_nodepool_max_count) | Maximum number of nodes in default nodepool | `number` | no |
| <a name="input_worker_nodepool_min_count"></a> [worker_nodepool_min_count](#input_worker_nodepool_min_count) | Minimum number of nodes in default nodepool | `number` | no |
| <a name="input_worker_nodepool_mode"></a> [worker_nodepool_mode](#input_worker_nodepool_mode) | Should this Node Pool be used for System or User resources | `string` | no |
| <a name="input_worker_nodepool_name"></a> [worker_nodepool_name](#input_worker_nodepool_name) | Additional kubernetes node pool | `string` | no |
| <a name="input_worker_nodepool_sku"></a> [worker_nodepool_sku](#input_worker_nodepool_sku) | Azure VM Sku of worker node | `string` | no |
| <a name="input_workload_identity_enabled"></a> [workload_identity_enabled](#input_workload_identity_enabled) | Enable workload identity in azure or not | `bool` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_cluster_control_plane_url"></a> [aks_cluster_control_plane_url](#output_aks_cluster_control_plane_url) | FQDN of the Azure Kubernetes Managed Cluster |
| <a name="output_aks_cluster_name"></a> [aks_cluster_name](#output_aks_cluster_name) | Azure AKS name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->