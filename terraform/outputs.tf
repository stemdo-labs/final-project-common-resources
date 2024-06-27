output "aks_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The Kubernetes Managed Cluster ID."
}


output "properties" {
  value       = azurerm_kubernetes_cluster.aks
  description = "An object with all of the AKS' terraform properties."
}