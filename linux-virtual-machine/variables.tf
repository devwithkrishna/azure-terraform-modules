
variable "resource_group_name" {
  default     = "JENKINS-DOCKEHOST-RG"
  description = "Azure resource group name"
  type        = string
}
variable "vmname" {
  type        = string
  default     = "JENKINS-DOCKERHOST-VM"
  description = "Azure virtual machine name"
}
variable "location" {
  default     = "centralindia"
  description = "Azure location where VM is deployed"
  type        = string
}
variable "vnet_name" {
  default     = "ARCHITECTS-CENTRAL-INDIA-VNET"
  type        = string
  description = "Virtual network name where VM will be attached"
}
variable "vnet_rg" {
  default     = "ARCHITECTS-CENTRAL-INDIA-VNET-RG"
  type        = string
  description = "Virtual network resource group name"
}
variable "subnet_name" {
  default     = "ARCHITECTS-PROTECTED-CI-SUBNET"
  description = "Subnet name where VM will be attached"
  type        = string
}
variable "public_ip_address_name" {
  default     = "JENKINS-DOCKERHOST-PUBLIC-IP"
  description = "Public IP address name"
  type        = string
}
variable "vm_sku" {
  default     = "Standard_D2as_v4"
  description = "Azure virtual machine SKU"
  type        = string
}
variable "os_disk_size" {
  default     = 32
  description = "OS disk size in GB"
  type        = number
}


variable "environment" {
  default     = "DEV"
  description = "Environment tag value in Azure"
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

variable "priority" {
  default     = ""
  description = "Type of vmss instances Spot or regular"
  type        = string
  validation {
    condition     = contains(["Spot", "Regular"], var.priority)
    error_message = "Priority Should be either Regular or Spot."
  }
}

variable "eviction_policy" {
  default     = "Delete"
  description = "Azure Spot VM eviction policy Delete or Deallocate"
  type        = string
  validation {
    condition     = contains(["Delete", "Deallocate"], var.eviction_policy)
    error_message = "eviction policy value must be either 'Delete' or 'Deallocate'."
  }
}

variable "source_image_reference" {
  description = "Source image reference for the virtual machine"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}