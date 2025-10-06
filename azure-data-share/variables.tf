variable "resource_group_name" {
  type        = string
  description = "Azure Data Share Rg"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure data share location"
  default     = ""
}

variable "data_share_name" {
  description = "Azure Data Share name"
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

variable "share_name" {
  default     = ""
  type        = string
  description = "Data share - Share's name"
}

variable "share_type" {
  default     = "CopyBased"
  type        = string
  description = "Data share - Share's type"
  validation {
    condition     = contains(["CopyBased", "InPlace"], var.share_type)
    error_message = "The share type must be either 'CopyBased' or 'InPlace'."
  }
}

variable "share_description" {
  default     = ""
  type        = string
  description = "Data share - ${var.shares_name}"

}

variable "datashare_terms" {
  type        = string
  description = "The terms of the Data Share."
  default     = "Data share terms of ${var.shares_name}"
}

variable "snapshot_schedule_name" {
  type        = string
  description = "The name of the snapshot schedule."
  default     = ""
}

variable "snapshot_recurrence" {
  type        = string
  description = "The recurrence of the snapshot schedule."
  default     = ""
  validation {
    condition     = contains(["Hour", "Day"], var.snapshot_recurrence)
    error_message = "The snapshot recurrence must be one of 'Hour', 'Day'."
  }

}

variable "snapshot_start_time" {
  type        = string
  description = "The start time of the snapshot schedule in UTC format (e.g., '2023-10-01T00:00:00Z'). If not provided, it defaults to one hour from the current time. This should be in RFC 3389 format."
  default     = null

}