
#Create resource group for VM
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}

#refer existing virtual network in same location
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg
}

# refer existing subnet in the virtual network
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg
}

#create network interface for VM
resource "azurerm_network_interface" "nic" {
  name                = "${var.vmname}-NIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_version    = "IPv4"

  }
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}
# Create public IP address
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_address_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}

#create ubuntu VM in azure
resource "azurerm_linux_virtual_machine" "vm" {

  resource_group_name             = var.resource_group_name
  name                            = lower(var.vmname)
  location                        = azurerm_resource_group.rg.location
  size                            = var.vm_sku
  eviction_policy                 = var.eviction_policy
  priority                        = var.priority
  disable_password_authentication = "false"
  admin_username                  = random_pet.vm_username.id
  admin_password                  = random_password.password.result
  custom_data                     = data.template_cloudinit_config.config.rendered
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    name                 = "${upper(var.vmname)}-OS-DISK"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version

  }
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}
