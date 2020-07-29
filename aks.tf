provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

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
        vm_size             = "Standard_DS2_v2"
        enable_auto_scaling = false
    }

    identity {
        type = "SystemAssigned"
    }

    addon_profile {
        oms_agent {
            enabled = false
        }

        aci_connector_linux {
            enabled = false
        }

        kube_dashboard {
            enabled = false
        }

        http_application_routing {
            enabled = false
        }

        azure_policy {
            enabled = false
        }
    }

    tags = {
        Environment = "Development"
    }
}