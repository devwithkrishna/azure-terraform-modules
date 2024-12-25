variable "resource_group_name" {
  default     = ""
  description = "Azure resource group name to create managed identity"
  type        = string
}

variable "managed_identity_name" {
  default     = ""
  description = "Name of user assigned managed identity in Azure"
  type        = string
}

variable "location" {
  default     = ""
  description = "Azure location"
  type        = string
}


variable "application_name" {
  default     = "devwithkrishna"
  description = "Azure application name tag value"
  type        = string
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

variable "temporary" {
  default     = "TRUE"
  description = "Temporary tag value in Azure"
  type        = string
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.temporary))
    error_message = "The temporary tag value must be either 'TRUE' or 'FALSE'."
  }

}

