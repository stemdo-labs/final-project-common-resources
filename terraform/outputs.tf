output "aks_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The Kubernetes Managed Cluster ID."
}

output "kube_config_raw" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
}

output "properties" {
  value       = azurerm_kubernetes_cluster.aks
  description = "An object with all of the AKS' terraform properties."
}