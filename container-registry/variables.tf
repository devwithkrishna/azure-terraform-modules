variable "resource_group_name" {
  type        = string
  description = "Azure container registry Rg"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure container registry location"
  default     = ""
}

variable "container_registry_name" {
  description = "Azure container registry name"
  type        = string
  default     = ""

}

variable "sku_name" {
  default     = "Basic"
  description = "Container registry SKUs available in Azure. Valid options are Basic, Standard or Premium"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku_name)
    error_message = "Container registry SKU should be one among Basic, Standard or Premium"
  }
}

variable "environment" {
  default     = "DEV"
  description = "Environment tag value in Azure"
  type        = string
  validation {
    condition     = contains(["DEV", "QA", "UAT", "PROD"], var.environment)
    error_message = "Environment value should be one among DEV or QA or UAT or PROD."
  }
}

variable "application_name" {
  default     = "devwithkrishna"
  description = "Azure application name tag"
}

variable "temporary" {
  default     = "TRUE"
  description = "Temporary tag value in Azure"
  type        = string
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.temporary))
    error_message = "The temporary tag value must be either 'TRUE' or 'FALSE'."
  }

}

# Container registry extra config
variable "container_registry_config" {
  type = object({
    admin_enabled                 = optional(bool)
    quarantine_policy_enabled     = optional(bool)
    zone_redundancy_enabled       = optional(bool)
    public_network_access_enabled = optional(bool)
    retention_policy_in_days      = optional(number)
    trust_policy_enabled          = optional(bool)
    anonymous_pull_enabled        = optional(bool)
    data_endpoint_enabled         = optional(bool)
  })
  description = "Manages an Azure Container Registry"
}

#azure_service_bypass
variable "azure_services_bypass" {
  type        = string
  default     = "AzureServices"
  description = "Whether to allow trusted Azure services to access a network restricted Container Registry? Possible values are None and AzureServices. Defaults to AzureServices"
  validation {
    condition     = contains(["None", "AzureServices"], var.azure_services_bypass)
    error_message = "Possible values are None or AzureServices"
  }
}

# Acr geo replication config
variable "georeplications" {
  description = "A list of Azure locations where the container registry should be geo-replicated"
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool)
  }))
  default = []

}