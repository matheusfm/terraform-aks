# reference: https://docs.microsoft.com/en-us/azure/aks/ingress-basic
resource "helm_release" "ingress-nginx" {
  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"

  values = [
    file("ingress-nginx-values.yaml")
  ]

}
