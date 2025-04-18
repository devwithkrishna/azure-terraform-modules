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
      	 admin_user  = ""
      	 application_name  = "devwithkrishna"
      	 compute_tier  = "Free"
      	 environment  = "DEV"
      	 high_availability_mode  = "Disabled"
      	 location  = ""
      	 mongo_create_mode  = "Default"
      	 mongo_version  = "7.0"
      	 mongodb_cluster_name  = ""
      	 public_network_access  = "Enabled"
      	 resource_group_name  = ""
      	 shard_count  = 1
      	 storage_size_in_gb  = 32
      	 temporary  = "TRUE"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_mongo_cluster.mongo](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mongo_cluster) | resource |
| [azurerm_resource_group.mongo_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_admin_user"></a> [admin_user](#input_admin_user) | Azure Mongo DB admin username | `string` | no |
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_compute_tier"></a> [compute_tier](#input_compute_tier) | The compute tier to assign to the MongoDB Cluster | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_high_availability_mode"></a> [high_availability_mode](#input_high_availability_mode) | The high availability mode for the MongoDB Cluster | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure Mongo DB location | `string` | no |
| <a name="input_mongo_create_mode"></a> [mongo_create_mode](#input_mongo_create_mode) | The create mode for the MongoDB Cluster | `string` | no |
| <a name="input_mongo_version"></a> [mongo_version](#input_mongo_version) | The version of the MongoDB Cluster | `string` | no |
| <a name="input_mongodb_cluster_name"></a> [mongodb_cluster_name](#input_mongodb_cluster_name) | Azure Mongo DB name | `string` | no |
| <a name="input_public_network_access"></a> [public_network_access](#input_public_network_access) | Public Network Access setting for the MongoDB Cluster | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Mongo DB Rg | `string` | no |
| <a name="input_shard_count"></a> [shard_count](#input_shard_count) | The Number of shards to provision on the MongoDB Cluster | `number` | no |
| <a name="input_storage_size_in_gb"></a> [storage_size_in_gb](#input_storage_size_in_gb) | The storage size in GB for the MongoDB Cluster | `number` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mongodb_admin_password"></a> [mongodb_admin_password](#output_mongodb_admin_password) | Azure Mongo DB admin password |
| <a name="output_mongodb_admin_username"></a> [mongodb_admin_username](#output_mongodb_admin_username) | Azure Mongo DB admin username |
| <a name="output_mongodb_cluster_name"></a> [mongodb_cluster_name](#output_mongodb_cluster_name) | Azure Mongo DB name |
| <a name="output_mongodb_compute_tier"></a> [mongodb_compute_tier](#output_mongodb_compute_tier) | Azure Mongo DB compute tier |
| <a name="output_mongodb_location"></a> [mongodb_location](#output_mongodb_location) | Azure mongo DB  location |
| <a name="output_mongodb_shard_count"></a> [mongodb_shard_count](#output_mongodb_shard_count) | Azure Mongo DB shard count |
| <a name="output_mongodb_storage_size"></a> [mongodb_storage_size](#output_mongodb_storage_size) | Azure Mongo DB storage size in GB |
| <a name="output_public_access_enabled"></a> [public_access_enabled](#output_public_access_enabled) | Azure Mongo DB enabled public access or not |
| <a name="output_resource_group"></a> [resource_group](#output_resource_group) | Azure mongo DB resource group name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->