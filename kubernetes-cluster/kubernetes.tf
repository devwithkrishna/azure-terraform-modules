# Create k8s service resource group
resource "azurerm_resource_group" "rg" {
  name     = upper(var.resource_group_name)
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}

# Create AKS cluster, nodepools, loadbalancer etc
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                      = upper(var.aks_cluster_name)
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  automatic_upgrade_channel = var.automatic_upgrade_channel
  kubernetes_version        = var.kubernetes_version
  sku_tier                  = var.kubernetes_sku_tier
  node_resource_group       = var.aks_node_resource_group_name

  dns_prefix = var.aks_cluster_name

  azure_active_directory_role_based_access_control {
    tenant_id              = data.azurerm_client_config.current.tenant_id
    admin_group_object_ids = data.azuread_groups.cluster_admin.object_ids
  }

  network_profile {
    network_plugin      = var.network_plugin
    network_plugin_mode = var.network_plugin_mode
    network_policy      = var.network_policy
    pod_cidr            = var.pod_cidr_range
    service_cidr        = var.service_cidr_subnet
    load_balancer_sku   = var.load_balancer_sku
    dns_service_ip      = cidrhost((var.service_cidr_subnet), 5) # 5th ip on service cidr subnet
  }

  dynamic "identity" {
    for_each = var.authentication_method == "identity" ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  dynamic "service_principal" {
    for_each = var.authentication_method == "service_principal" ? [1] : []
    content {
      client_id     = data.azurerm_key_vault_secret.appid.value
      client_secret = data.azurerm_key_vault_secret.secret.value
    }
  }

  workload_identity_enabled = var.workload_identity_enabled
  oidc_issuer_enabled       = var.workload_identity_enabled ? true : false

  support_plan = var.support_plan

  storage_profile {
    blob_driver_enabled = var.enable_blob_driver
    disk_driver_enabled = var.enable_disk_driver
    file_driver_enabled = var.enable_fileshare_driver
  }

  default_node_pool {
    name                   = var.default_nodepool_name
    vm_size                = var.default_nodepool_sku
    auto_scaling_enabled   = var.default_nodepool_autoscaling
    type                   = "VirtualMachineScaleSets"
    node_public_ip_enabled = var.node_public_ip_enabled
    orchestrator_version   = var.kubernetes_version
    max_pods               = var.max_pods_per_node
    vnet_subnet_id         = data.azurerm_subnet.vnet_subnet_cidr.id
    os_sku                 = var.os_sku
    max_count              = var.default_nodepool_max_count
    min_count              = var.default_nodepool_min_count
    tags = {
      Environment     = upper(var.environment)
      DisplayName     = upper(var.default_nodepool_name)
      ApplicationName = lower(var.application_name)
      Temporary       = upper(var.temporary)
    }

  }

  depends_on = [azurerm_resource_group.rg]

  key_vault_secrets_provider {
    secret_rotation_enabled  = var.key_vault_secrets_provider
    secret_rotation_interval = var.secret_rotation_interval
  }

  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.aks_cluster_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }

}

# Create worker nodepool
resource "azurerm_kubernetes_cluster_node_pool" "workernodes" {
  name                   = var.worker_nodepool_name
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size                = var.worker_nodepool_sku
  auto_scaling_enabled   = var.worker_nodepool_autoscaling
  node_public_ip_enabled = var.node_public_ip_enabled
  priority               = var.worker_node_spot ? "Spot" : "Regular"
  scale_down_mode        = var.worker_node_scaledown_mode
  vnet_subnet_id         = data.azurerm_subnet.vnet_subnet_cidr.id
  min_count              = var.worker_nodepool_min_count
  max_count              = var.worker_nodepool_max_count
  eviction_policy        = var.worker_nodepool_eviction_policy
  os_sku                 = var.os_sku
  os_disk_size_gb        = var.os_disk_size_in_gb
  orchestrator_version   = var.kubernetes_version
  max_pods               = var.max_pods_per_node
  tags = {
    Environment     = upper(var.environment)
    DisplayName     = upper(var.worker_nodepool_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}