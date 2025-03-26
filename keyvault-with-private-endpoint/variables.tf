variable "resource_group_name" {
  type        = string
  description = "Azure keyvault Rg"
}

variable "location" {
  type        = string
  description = "Azure keyvault location"
  default     = ""
}

variable "keyvault_name" {
  description = "Azure keyvault name"
  type        = string

}

variable "sku_name" {
  default     = "standard"
  description = "Keyvault SKUs available in azure. Valid options are standard and premium"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "Keyvault SKU should be one among standard or premium"
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

variable "azure_vms_can_access_certs_stored_as_secrets" {
  default     = false
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault"
}

variable "azure_disk_encryption_can_retrieve_secrets" {
  default     = false
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys"
}

variable "azure_resource_manager_can_retrieve_secrets" {
  default     = false
  type        = bool
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the vault"
}

variable "enable_rbac_authorization" {
  default     = false
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions"
}

variable "purge_protection_enabled" {
  type        = bool
  default     = false
  description = "Purge Protection enabled or not"
}

variable "public_network_access_enabled" {
  default     = true
  type        = bool
  description = "Whether public network access is allowed for this Key Vault"
}

variable "soft_delete_retention_days" {
  default     = 90
  type        = number
  description = " The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90"
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "This value should be between 7 and 90 both included."
  }
}


variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network in which private endpoint will be created"
  default    = ""  
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet in which private endpoint will be created"
  default    = ""  
}

variable "virtual_network_rg" {
  type = string
  default = "value"
  description = "Virtual network resource group"
}