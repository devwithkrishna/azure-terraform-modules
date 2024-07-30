resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_api_management" "apim" {
  name                = var.api_management_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = tostring(var.publisher_name)
  publisher_email     = tostring(var.publisher_email)

  sku_name = "${var.sku_name_part1}_${var.sku_name_part2}"
}