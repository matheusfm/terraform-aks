variable "node_count" {
    default = 1
}

variable "dns_prefix" {
    default = "k8stest"
}

variable cluster_name {
    default = "k8stest"
}

variable resource_group_name {
    default = "azure-k8stest"
}

variable location {
    default = "East US"
#    default = "Australia East" # available on free tier
}

variable "vm_size" {
    default = "Standard_B2s"
}
