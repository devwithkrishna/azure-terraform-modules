output "aks_cluster_name" {
  description = "Azure AKS name"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_control_plane_url" {
  description = "FQDN of the Azure Kubernetes Managed Cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.fqdn
}