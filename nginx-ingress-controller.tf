provider "helm" {
  kubernetes {
    load_config_file       = "false"
    host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
  }
}

# following this tutorial https://docs.microsoft.com/en-us/azure/aks/ingress-basic
data "helm_repository" "nginx-ingress" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com/"
}

resource "helm_release" "nginx-ingress" {
  name             = "nginx-ingress"
  namespace        = "nginx-ingress"
  create_namespace = true
  repository       = data.helm_repository.nginx-ingress.name
  chart            = "nginx-ingress"

  set {
    name  = "controller.replicaCount"
    value = "2"
  }

  set {
    name  = "controller.nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }

  set {
    name  = "defaultBackend.nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }
}
