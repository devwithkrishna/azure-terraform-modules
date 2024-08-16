resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
  }
}

resource "random_password" "password" {
  length           = 32
  min_lower        = 4
  min_numeric      = 4
  min_special      = 4
  min_upper        = 4
  override_special = "!#$%&*-_=+[]{}:?"
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                            = var.vmss_name
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  admin_username                  = var.admin_username
  disable_password_authentication = false
  admin_password                  = random_password.password.result
  sku                             = var.sku_size
  custom_data                     = base64encode(data.local_file.cloudinit.content)
  priority = var.priority
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.vmss_name)
    ApplicationName = lower(var.application_name)
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  network_interface {
    name    = "${var.vmss_name}-nic" 
    primary = true
    ip_configuration {
      name      = "${var.vmss_name}-ipconfig"
      primary   = true
      subnet_id = data.azurerm_subnet.subnet.id
    }
  }
  dynamic "data_disk" {
    for_each = var.additional_data_disks
    content {
      lun                  = data_disk.key
      disk_size_gb         = data_disk.value
      caching              = "ReadWrite"
      name = "${var.vmss_name}-datadisk"
      storage_account_type = var.additional_data_disks_storage_account_type

    }
  }

}

