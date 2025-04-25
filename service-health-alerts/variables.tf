variable "resource_group_name" {
  type        = string
  description = "Azure Service health Rg"
  default     = ""
}

variable "resource_group_location" {
  type        = string
  description = "Azure Service health Rg location"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure Service health activity log location"
  default     = "Global"
}



variable "service_health_alert_name" {
  description = "Azure Service health alert name"
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

variable "action_group_name" {
  description = "The name of the action group"
  type        = list(string)
  default = [""]
}

variable "use_exisiting_rg" {
  description = "Whether to use existing resource group or create a new one"
  default     = false
  type        = bool
}

variable "existing_action_group_rg" {
  description = "Existing action group resource group"
  default     = [""]
  type        = list(string)
}

variable "use_existing_action_group" {
  description = "Whether to use existing action group or create a new one"
  default     = false
  type        = bool
}

variable "service_health_categories" {
  description = "The category of the operation Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth."
  default = [
    "Administrative",
    "Autoscale",
    "Policy",
    "Recommendation",
    "ResourceHealth",
    "Security",
    "ServiceHealth"
  ]
  type = list(string)
  validation {
    condition = alltrue([
      for c in var.service_health_categories :
      contains([
        "Administrative",
        "Autoscale",
        "Policy",
        "Recommendation",
        "ResourceHealth",
        "Security",
        "ServiceHealth"
      ], c)
    ])
    error_message = "Each value in alert_categories must be one of: Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security, or ServiceHealth."
  }

}

variable "action_group_name" {
  description = "The name of the action group"
  type        = string
  default     = ""
}

variable "email_action_type" {
  description = "Enable emails from action group"
  type = bool
  default = true
}

variable "azure_push_action_type" {
  description = "Enable push notifications from action group"
  type = bool
  default = true
  
}

variable "email_address" {
  description = "Email address to receive notifications"
  type        = list(string)
  default     = [""]
  validation {
    condition     = alltrue([for email in var.email_address : can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", email))])
    error_message = "Each email address must be in a valid format."
  }
  
}