output "resource_group" {
  description = "Azure mongo DB resource group name"
  value       = azurerm_resource_group.mongo_rg.name
}

output "mongodb_cluster_name" {
  description = "Azure Mongo DB name"
  value       = azurerm_mongo_cluster.mongo.name
}

output "mongodb_location" {
  description = "Azure mongo DB  location"
  value       = azurerm_mongo_cluster.mongo.location
}

output "public_access_enabled" {
  description = "Azure Mongo DB enabled public access or not"
  value       = azurerm_mongo_cluster.mongo.public_network_access
}

output "mongodb_admin_username" {
  description = "Azure Mongo DB admin username"
  value       = azurerm_mongo_cluster.mongo.administrator_username
  sensitive   = false
}

output "mongodb_admin_password" {
  description = "Azure Mongo DB admin password"
  value       = nonsensitive(random_password.password.result)
  sensitive   = false
}

output "mongodb_compute_tier" {
  description = "Azure Mongo DB compute tier"
  value       = azurerm_mongo_cluster.mongo.compute_tier
}

output "mongodb_shard_count" {
  description = "Azure Mongo DB shard count"
  value       = azurerm_mongo_cluster.mongo.shard_count
}

output "mongodb_storage_size" {
  description = "Azure Mongo DB storage size in GB"
  value       = azurerm_mongo_cluster.mongo.storage_size_in_gb
}
