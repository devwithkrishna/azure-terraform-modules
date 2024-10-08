data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.vnet_resource_group
  virtual_network_name = var.vnet_name
}

data "local_file" "cloudinit" {
  filename = "${path.module}/cloudinit.conf"
}