variable "resource_group_name" {
  type        = string
  description = "Azure Datafactory Rg"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure Data factory location"
  default     = ""
}

variable "data_factory_name" {
  description = "Azure Data factory name"
  type        = string
  default     = ""

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

variable "managed_virtual_network_enabled" {
  description = "Is Managed Virtual Network enabled"
  default     = "true"
  type        = string
}

variable "public_network_enabled" {
  description = "Is Public Network enabled"
  default     = "true"
  type        = string
}