output "cluster_username" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.username
}

output "cluster_password" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.password
}

output "get_credentials" {
    value = "az aks get-credentials --name ${var.cluster_name} --resource-group ${var.resource_group_name} --admin"
}