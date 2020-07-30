# terraform-aks
Terraform to create a simple Azure Kubernetes Service (AKS) with NGINX Ingress Controller

## TL;DR

```console
$ az login
$ terraform init
$ terraform apply
$ $(terraform output get_credentials)
```

### References:
* A complete tutorial for multi-person environment: https://docs.microsoft.com/en-us/azure/developer/terraform/create-k8s-cluster-with-tf-and-aks#set-up-azure-storage-to-store-terraform-state
* Terraform azurerm provider examples: https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples/kubernetes
* Deploying the NGINX Ingress Controller in an AKS cluster: https://docs.microsoft.com/en-us/azure/aks/ingress-basic
* https://learn.hashicorp.com/terraform/kubernetes/provision-aks-cluster
