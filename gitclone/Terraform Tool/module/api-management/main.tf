data "azurerm_resource_group" "resouce-group-api" {
  name = var.resource_group_name

}

resource "azurerm_api_management" "apimanagement" {
  count               = var.create_api == true ? 1 : 0
  name                = var.api_management_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resouce-group-api.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name = var.sku
}
