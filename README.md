# terraform-aks
Terraform to create a simple Azure Kubernetes Service (AKS) with NGINX Ingress Controller

## TL;DR

```console
$ az login
$ terraform init
$ terraform apply
$ $(terraform output get_credentials)
```

References:
* A complete tutorial for multi-person environment: https://docs.microsoft.com/en-us/azure/developer/terraform/create-k8s-cluster-with-tf-and-aks#set-up-azure-storage-to-store-terraform-state
* Examples: https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples/kubernetes
* https://learn.hashicorp.com/terraform/kubernetes/provision-aks-cluster