data "azurerm_resource_group" "resouce-group" {
  name                = var.resource_group_name

}

# Defined Azure Service Plan 
resource "azurerm_app_service_plan" "app-service-plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resouce-group.name
  sku {
    tier          = "PremiumV3"
    size          = "P2V3"
  }
}
