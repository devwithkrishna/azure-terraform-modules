output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}
output "virtul_machine_name" {
  description = "Virtual machine name"
  value       = var.vmname

}
output "location" {
  description = "Location of the resource"
  value       = var.location
}
output "vnet_name" {
  description = "Virtual Network used for the VM"
  value       = var.vnet_name
}
output "subnet_name" {
  description = "Subnet used for the VM"
  value       = var.subnet_name
}
output "public_ip_address_name" {
  description = "Public IP address name"
  value       = azurerm_public_ip.public_ip.name
}
output "vm_sku" {
  value       = var.vm_sku
  description = "Azure VM SKU"
}
output "public_ip_address" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "Public IP address of the VM"
}

output "vm_user_name" {
  description = "value of the username"
  value       = random_pet.vm_username.id
  sensitive   = false
}

output "vm_user_password" {
  description = "value of the password"
  value       = nonsensitive(random_password.password.result)
  sensitive   = false
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}