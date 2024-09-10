variable "resource_group_name" {
  default     = ""
  description = "Azure VMSS resource group name"
  type        = string
}

variable "vmss_name" {
  default     = ""
  description = "Azure VMSS name"
  type        = string
}

variable "location" {
  default     = ""
  description = "Azure location"
  type        = string
}

variable "sku_size" {
  default     = ""
  description = "Azure VMSS sku"
  type        = string
}

variable "default_instance_count" {
  default     = 0
  description = "Default instance count for the VMSS"
  type        = number
}

variable "admin_username" {
  default     = "admin_user"
  description = "VMSS default user name"
  type        = string
}


variable "subnet_name" {
  default     = ""
  description = "Azure subnet name to create vmss"
  type        = string
}

variable "vnet_name" {
  default     = ""
  description = "Azure Vnet Name"
  type        = string
}

variable "vnet_resource_group" {
  default     = ""
  description = "Azure Vnet resource group"
  type        = string
}


variable "os_disk_storage_account_type" {
  default     = "Standard_LRS"
  description = "OS disk storage account type"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "StandardSSD_ZRS", "Premium_LRS", "Premium_ZRS"], var.os_disk_storage_account_type)
    error_message = "OS disk storage account type must be one among Standard_LRS,StandardSSD_LRS,StandardSSD_ZRS,Premium_LRS,Premium_ZRS."
  }
}

variable "os_disk_size" {
  default     = 30
  description = "OS disk size in GB"
  type        = number
}


variable "additional_data_disks" {
  description = "Adding additional disks capacity to add each instance in GB"
  type        = list(number)
  default     = []
}

variable "additional_data_disks_storage_account_type" {
  description = "The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, Premium_LRS and UltraSSD_LRS."
  default     = "Standard_LRS"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "StandardSSD_ZRS", "Premium_LRS", "Premium_ZRS"], var.additional_data_disks_storage_account_type)
    error_message = "Data disk storage account type must be one among Standard_LRS,StandardSSD_LRS,StandardSSD_ZRS,Premium_LRS,Premium_ZRS."
  }
}

variable "application_name" {
  default     = ""
  description = "Azure application name tag"
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

variable "priority" {
  default     = ""
  description = "Type of vmss instances Spot or regular"
  type        = string
  validation {
    condition     = contains(["Spot", "Regular"], var.priority)
    error_message = "Priority Should be either Regular or Spot."
  }
}

variable "eviction_policy" {
  default     = "Delete"
  description = "Azure Spot VM eviction policy Delete or Deallocate"
  type        = string
}

variable "load_balancer_sku" {
  default     = "Basic"
  description = "Azure Loadbalancer Skus"
  type        = string
  validation {
    condition     = contains(["Basic", "Standard", "Gateway"], var.load_balancer_sku)
    error_message = "Load balancer SKU must be one among Basic , Standard or Gateway type."
  }
}

variable "frontend_port" {
  default     = 80
  type        = number
  description = "Port on which queries for status of application"
}

variable "backend_port" {
  default     = 80
  type        = number
  description = "Port on which traffic is passed on to application backends"
}
variable "request_path" {
  default     = "/"
  type        = string
  description = "Health check path"
}

variable "protocol" {
  default     = "Http"
  description = "Protocol for Load balancing"
  type        = string
  validation {
    condition     = contains(["Http", "Https", "Tcp"], var.protocol)
    error_message = "Protocol value should be one among Http, Https or Tcp."
  }
}

