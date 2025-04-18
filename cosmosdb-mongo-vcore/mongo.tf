resource "azurerm_resource_group" "mongo_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}

resource "azurerm_mongo_cluster" "mongo" {
  name                  = var.mongodb_cluster_name
  resource_group_name   = azurerm_resource_group.mongo_rg.name
  location              = azurerm_resource_group.mongo_rg.location
  public_network_access = var.public_network_access

  compute_tier           = var.compute_tier
  shard_count            = var.shard_count
  storage_size_in_gb     = var.storage_size_in_gb
  high_availability_mode = var.high_availability_mode

  administrator_username = var.admin_user
  administrator_password = random_password.password.result

  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.mongodb_cluster_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }

  depends_on = [random_password.password]
}