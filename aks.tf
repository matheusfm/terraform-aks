resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name                = "default"
        node_count          = var.node_count
        vm_size             = var.vm_size
        enable_auto_scaling = false
    }

    identity {
        type = "SystemAssigned"
    }

    azure_policy_enabled = false

    http_application_routing_enabled = false

    tags = {
        Environment = "Development"
    }
}