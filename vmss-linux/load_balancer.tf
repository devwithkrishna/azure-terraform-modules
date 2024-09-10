resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_public_ip" "lb_pub_ip" {
  name                = "${var.vmss_name}-publicip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "${var.vmss_name}-lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku = var.load_balancer_sku

  frontend_ip_configuration {
    name                 = "${var.vmss_name}-frontend-ip"
    public_ip_address_id = azurerm_public_ip.lb_pub_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.vmss_name}-lb-backendaddresspool"
  
}