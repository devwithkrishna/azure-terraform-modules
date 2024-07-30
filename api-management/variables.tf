variable "resource_group_name" {
  type = string
  description = "Azure Storage Account Rg"
}

variable "location" {
  type = string
  description = "Azure storage account location"
}

variable "api_management_name" {
  description = "Azure api management name"
  type = string
}

variable "publisher_name" {
  description = "Publisher of API"
  type = list(string)
  validation {
    condition = can(index(var.publisher_name, 0))
    error_message = "A value is required for Publisher name."
  }
}

variable "publisher_email" {
  description = "Email ID of API publishers"
  type = list(string)
  validation {
    condition     = can(index(var.publisher_email, 0))
    error_message = "At least one Publisher email is required."    
  }
}

variable "sku_name_part1" {
  description = "SKU name of API management "
  type = string
  validation {
    condition = contains(["Consumption","Developer","Basic","Standard", "Premium"], var.sku_name_part1)
    error_message = "SKU name should be one among Consumption, Developer,Basic,Standard,Premium."
  } 
}

variable "sku_name_part2" {
  description = "Sku capacity part"
  type = string
}