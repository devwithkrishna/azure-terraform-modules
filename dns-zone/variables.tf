variable "resource_group_name" {
  type        = string
  description = "Azure DNS Zone Rg"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure DNS RG location"
  default     = ""
}

variable "dns_zone_name" {
  description = "Azure DNS Zone name"
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

