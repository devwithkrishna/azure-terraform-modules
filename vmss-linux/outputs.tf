output "subnet_id" {
  value       = data.azurerm_subnet.subnet.id
  description = "Azure Subnet id"
}

output "azure_vmss_name" {
  value       = azurerm_linux_virtual_machine_scale_set.vmss.name
  description = "Azure VMSS name"
}

output "azure_vmss_rg" {
  value       = azurerm_resource_group.rg.name
  description = "Azure VMSS Rg"
}

output "type_of_instances" {
  value       = azurerm_linux_virtual_machine_scale_set.vmss.priority
  description = "Sopt or Regular instances"
}

output "data_disks" {
  value       = azurerm_linux_virtual_machine_scale_set.vmss.data_disk
  description = "VMSS data disks"
}

output "os_disk" {
  value       = azurerm_linux_virtual_machine_scale_set.vmss.os_disk[0].disk_size_gb
  description = "VMSS os disk size"
}

output "admin_username" {
  value       = var.admin_username
  description = "VMSS user name"
}

output "admin_password" {
  value       = random_password.password.result
  sensitive   = false
  description = "VMSS user password"
}

output "loadbalancer_id" {
  value = azurerm_lb.lb.id
  description = "AzureLoad balancer Id"
}

output "Load_balancer_frontend_public_ip" {
  value = azurerm_public_ip.lb_pub_ip.ip_address
  description = "Azure load balancer frontend ip address"
}
