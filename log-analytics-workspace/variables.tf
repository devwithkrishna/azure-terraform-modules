variable "resource_group_name" {
  default = ""
  description = "Azure resource group name to create log analytics workspace"
  type = string
}

variable "location" {
  default = ""
  description = "Azure location"
  type = string
}

variable "loganalytics_workspace_name" {
  default = ""
  type = string
  description = "Loganalytics workspace name"
}

variable "loganalytics_retention_period" {
  default = 7
  description = "Loganalytics logs retention period"
  type = number
  validation {
    condition = var.loganalytics_retention_period == 7 || (var.loganalytics_retention_period >= 30 && var.loganalytics_retention_period <= 730)
    error_message = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
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

variable "loganalytics_sku" {
  default = "PerGB2018"
  type = string
  description = "Specifies the SKU of the Log Analytics Workspace"
  validation {
    condition     = contains(["PerNode", "Premium", "Standard", "Standalone", "Unlimited", "CapacityReservation", "PerGB2018"], var.loganalytics_sku)
    error_message = "Log analytics SKU should be one among PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation or PerGB2018 ."
  }
}

