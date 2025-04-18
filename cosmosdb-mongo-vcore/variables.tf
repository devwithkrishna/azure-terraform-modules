variable "resource_group_name" {
  type        = string
  description = "Azure Mongo DB Rg"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure Mongo DB location"
  default     = ""
}

variable "mongodb_cluster_name" {
  description = "Azure Mongo DB name"
  type        = string
  default     = ""
}

variable "admin_user" {
  description = "Azure Mongo DB admin username"
  type        = string
  default     = ""
  validation {
    condition     = length(var.admin_user) > 0
    error_message = "The admin_user variable must be set to a non-empty string."
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

variable "compute_tier" {
  description = "The compute tier to assign to the MongoDB Cluster"
  default     = "Free"
  type        = string
  validation {
    condition     = contains(["Free", "M10", "M20", "M25", "M30", "M40", "M50", "M60", "M80", "M200"], var.compute_tier)
    error_message = "The compute_tier value must be one of the following: 'Free', 'M10', 'M20', 'M25', 'M30', 'M40', 'M50', 'M60', 'M80', or 'M200'."
  }
}

variable "shard_count" {
  description = "The Number of shards to provision on the MongoDB Cluster"
  type        = number
  default     = 1
}

variable "public_network_access" {
  default     = "Enabled"
  description = "Public Network Access setting for the MongoDB Cluster"
  type        = string
  validation {
    condition     = contains(["Enabled", "Disabled"], var.public_network_access)
    error_message = "The public_network_access value must be either 'Enabled' or 'Disabled'."
  }
}

variable "storage_size_in_gb" {
  default     = 32
  description = "The storage size in GB for the MongoDB Cluster"
  type        = number
}

variable "high_availability_mode" {
  description = "The high availability mode for the MongoDB Cluster"
  default     = "Disabled"
  type        = string
  validation {
    condition     = contains(["ZoneRedundantPreferred", "Disabled"], var.high_availability_mode)
    error_message = "The high_availability_mode value must be either 'Disabled', 'ZoneRedundantPreferred'."
  }
}

variable "mongo_create_mode" {
  description = "The create mode for the MongoDB Cluster"
  default     = "Default"
  type        = string
  validation {
    condition     = contains(["Default", "GeoReplica"], var.mongo_create_mode)
    error_message = "The mongo_create_mode value must be either 'Default' or 'GeoReplica'."
  }

}

variable "mongo_version" {
  description = "The version of the MongoDB Cluster"
  default     = "7.0"
  type        = string
  validation {
    condition     = contains(["5.0", "6.0", "7.0"], var.mongo_version)
    error_message = "The mongo_version value must be either '5.0', '6.0', or '7.0'."
  }

}