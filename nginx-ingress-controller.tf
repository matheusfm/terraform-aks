provider "kubernetes" {
    load_config_file       = "false"
    host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
  }
}

resource "kubernetes_service_account" "nginx-ingress" {
    metadata {
        name        = "nginx-ingress"
        namespace   = "nginx-ingress"
    }
}

resource "kubernetes_cluster_role" "nginx-ingress" {
    metadata {
        name        = "nginx-ingress"
        namespace   = "nginx-ingress"
    }
    rule {
        api_groups = [""]
        resources  = ["services", "endpoints", "secrets", "pods"]
        verbs      = ["get", "list", "watch"]
    }
    rule {
        api_groups = [""]
        resources  = ["configmaps"]
        verbs      = ["get", "list", "watch", "update", "create"]
    }
    rule {
        api_groups = [""]
        resources  = ["events"]
        verbs      = ["list", "patch", "create"]
    }
    rule {
        api_groups = ["extensions", "networking.k8s.io"]
        resources  = ["ingresses"]
        verbs      = ["get", "list", "watch"]
    }
    rule {
        api_groups = ["extensions", "networking.k8s.io"]
        resources  = ["ingresses/status"]
        verbs      = ["update"]
    }
    rule {
        api_groups = ["k8s.nginx.org"]
        resources  = ["virtualservers", "virtualserverroutes", "globalconfigurations", "transportservers", "policies"]
        verbs      = ["get", "list", "watch"]
    }
    rule {
        api_groups = ["k8s.nginx.org"]
        resources  = ["virtualservers/status", "virtualserverroutes/status"]
        verbs      = ["update"]
    }
}

resource "kubernetes_cluster_role_binding" "nginx-ingress" {
    metadata {
        name        = "nginx-ingress"
        namespace   = "nginx-ingress"
    }
    subject {
        kind      = "ServiceAccount"
        name      = "nginx-ingress"
        namespace = "nginx-ingress"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "nginx-ingress"
    }
}