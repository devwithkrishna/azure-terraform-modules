variable "resource_group_name" {
  default     = ""
  description = "Azure resource group name to create aks cluster"
  type        = string
}

variable "aks_node_resource_group_name" {
  default     = ""
  description = "Azure node resource group name"
  type        = string
}

variable "aks_cluster_name" {
  default     = ""
  description = "Name of Aks cluster in Azure"
  type        = string
}

variable "location" {
  default     = ""
  description = "Azure location"
  type        = string
}


variable "application_name" {
  default     = ""
  description = "Azure application name tag value"
  type        = string
}

variable "environment" {
  default     = ""
  description = "Environment tag value in Azure"
  type        = string
  validation {
    condition     = contains(["DEV", "QA", "UAT", "PROD"], var.environment)
    error_message = "Environment value should be one among DEV or QA or UAT or PROD."
  }
}

variable "temporary" {
  default     = ""
  description = "Temporary tag value in Azure"
  type        = string
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.temporary))
    error_message = "The temporary tag value must be either 'TRUE' or 'FALSE'."
  }

}

variable "default_nodepool_sku" {
  default     = "Standard_D2ps_v5"
  description = "Aks system node pool"
  type        = string
}

variable "default_nodepool_name" {
  default     = "agentpool"
  description = "System nodepool for cluster"
  type        = string

}

variable "default_nodepool_autoscaling" {
  default     = true
  description = "Enable auto scaling in default nodepool"
  type        = bool
}

variable "default_nodepool_max_count" {
  description = "Maximum number of nodes in default nodepool"
  default     = 1
  type        = number

}

variable "default_nodepool_min_count" {
  description = "Minimum number of nodes in default nodepool"
  default     = 1
  type        = number
}

variable "cluster_admin_group_names"{
  default = [""]
  type = list(string)
  description = "Name of Azure AD groups to provide cluster admin permissions."
}


variable "max_pods_per_node" {
  default     = 100
  description = "maximum number of pods that can be accumulated in a node"
  type        = number
  validation {
    condition     = var.max_pods_per_node <= 250 && var.max_pods_per_node >= 10
    error_message = "The value must be between 10 and 250 (inclusive)."
  }
}

variable "key_vault_secrets_provider" {
  default     = true
  description = "Should the secret store CSI driver on the AKS cluster be enabled"
  type        = bool
}

variable "secret_rotation_interval" {
  default     = "1m"
  type        = string
  description = "The interval to poll for secret rotation"
}

variable "network_plugin" {
  default     = "azure"
  description = "Azure CNI network plugin"
  type        = string
}

variable "network_policy" {
  default     = "azure"
  description = "Azure networ policy to be used with CNI cluster"
  type        = string
}

variable "network_plugin_mode" {
  default     = "overlay"
  description = "Specifies the network plugin mode used for building the Kubernetes network"
  type        = string
}

variable "pod_cidr_range" {
  default     = "172.0.0.0/16"
  description = "CIDR range for pods"
  type        = string
}

variable "virtual_network_name" {
  default     = ""
  description = "Azure Vnet name"
  type        = string
}

variable "subnet_name" {
  default     = ""
  description = "Azure subnet name"
  type        = string
}

variable "service_cidr_subnet" {
  default     = "192.168.0.0/16"
  description = "Azure service cidr subnet"
  type        = string
}

variable "virtual_netwok_rg" {
  default     = ""
  description = "Azure Vnet resource group"
  type        = string
}

variable "load_balancer_sku" {
  default     = ""
  description = "Load balancer SKu"
  type        = string

  validation {
    condition     = contains(["basic", "standard"], var.load_balancer_sku)
    error_message = "Load balancer SKU should be either Basic or Standard."
  }
}

variable "os_sku" {
  default     = "Ubuntu"
  description = "AKS node pool image"
  type        = string
}

variable "os_disk_size_in_gb" {
  default     = 32
  description = "OS disk size"
  type        = number
}

variable "keyvault_name" {
  default = ""
  description = "Azure Key Vault name"
  type = string
}

variable "keyvault_rg_name" {
  default = ""
  description = "Azure Key Vault rg name"
  type = string
}

variable "workload_identity_enabled" {
  default = true
  description = "Enable workload identity in azure or not"
  type = bool
}

variable "enable_blob_driver" {
 default = true
 description = "Enable Blob CSI driver enabled"
 type = bool
}

variable "enable_disk_driver" {
 default = true
 description = "Enable Disk CSI driver enabled"
 type = bool
}

variable "enable_fileshare_driver" {
 default = true
 description = "Enable Fileshare CSI driver enabled"
 type = bool
}

variable "kubernetes_sku_tier" {
  description = "SKU Tier that should be used for this Kubernetes Cluster"
  default = ""
  type = string
  validation {
    condition     = contains(["Free", "Standard", "Premium"], var.kubernetes_sku_tier)
    error_message = "Kubernetes SKU should be One among Basic, Standard Or Premium."
  }
}

variable "private_cluster" {
  default = false
  description = "Deploy AKS cluster without exposing publically accessible endpoint"
  type = bool
  validation {
    condition = var.private_cluster == true || var.private_cluster == false
    error_message = "private_cluster value must either be true or false."
  }
}

variable "automatic_upgrade_channel" {
  description = "The upgrade channel for this Kubernetes Cluster"
  default = ""
  type = string
  validation {
    condition     = contains(["patch", "rapid", "node-image", "stable"], var.automatic_upgrade_channel)
    error_message = "The upgrade channel for this Kubernetes Cluster should be One among Patch, Rapid, Node-Image Or Stable."
  }
}

variable "support_plan" {
  default = "KubernetesOfficial"
  description = "Specifies the support plan which should be used for this Kubernetes Cluster"
  type = string
  validation {
    condition     = contains(["AKSLongTermSupport", "KubernetesOfficial"], var.support_plan)
    error_message = "Possible values are KubernetesOfficial and AKSLongTermSupport."
  }
}

variable "worker_nodepool_name" {
  default = "workernodes"
  description = "Additional kubernetes node pool"
  type = string
}

variable "worker_nodepool_sku" {
  default = "Standard_D2ads_v5"
  description = "Azure VM Sku of worker node"
  type = string
}

variable "worker_node_spot" {
  type = bool
  default = true
  description = "Worker nodes are spot or ondemand"
  validation {
    condition = var.worker_node_spot == true || var.worker_node_spot == false
    error_message = "worker_nodepool_sku should be true or false"
  }
}

variable "worker_nodepool_autoscaling" {
  default     = true
  description = "Enable auto scaling in worker nodepool"
  type        = bool
}

variable "node_public_ip_enabled" {
  default = false
  type = bool
  description = "Should each node have a Public IP Address"
}

variable "worker_node_scaledown_mode" {
  default = "Deallocate"
  description = "Specifies how the node pool should deal with scaled-down nodes"
  type = string
  validation {
    condition = contains(["Delete", "Deallocate"], var.worker_node_scaledown_mode)
    error_message = "This Value should be either Delete or Deallocate."
  }
}

variable "worker_nodepool_max_count" {
  description = "Maximum number of nodes in default nodepool"
  default     = 5
  type        = number

}

variable "worker_nodepool_min_count" {
  description = "Minimum number of nodes in default nodepool"
  default     = 0
  type        = number
}

variable "worker_nodepool_mode" {
  type = string
  default = "User"
  description = "Should this Node Pool be used for System or User resources"
  validation {
    condition = contains(["User", "System"], var.worker_nodepool_mode)
    error_message = "This Value should be either Delete or Deallocate."
  }
}

variable "worker_nodepool_eviction_policy" {
  default = "Deallocate"
  description = " Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool"
  type = string
  validation {
    condition = contains(["Delete", "Deallocate"], var.worker_nodepool_eviction_policy)
    error_message = "This Value should be either Delete or Deallocate."
  }
}

variable "kubernetes_version" {
  type = string
  default = "1.30.4"
  description = "Kubernetes version in AKS cluster"
  validation {
    condition     = can(regex("^[0-9]+\\.[0-9]+\\.[0-9]+$", var.kubernetes_version))
    error_message = "The version must be in the format 'major.minor.patch', where major, minor, and patch are non-negative integers."
  }
}