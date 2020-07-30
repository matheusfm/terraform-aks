output "get_credentials" {
  value = "az aks get-credentials --name ${var.cluster_name} --resource-group ${var.resource_group_name} --admin"
}