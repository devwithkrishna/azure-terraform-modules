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
  sku                 = var.load_balancer_sku

  frontend_ip_configuration {
    name                 = "${var.vmss_name}-frontend-ip"
    public_ip_address_id = azurerm_public_ip.lb_pub_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.vmss_name}-lb-backendaddresspool"

}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "port-${var.frontend_port}"
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = "${var.vmss_name}-frontend-ip"
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.backend_address_pool.id}"]
}

resource "azurerm_lb_probe" "health" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "Health Check Probe"
  port            = var.frontend_port
  protocol        = var.protocol
  request_path    = var.request_path
}