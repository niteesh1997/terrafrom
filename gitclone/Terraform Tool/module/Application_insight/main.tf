data "azurerm_resource_group" "resouce-group" {
  name                = var.resource_group_name
}

resource "azurerm_application_insights" "application-insights" {
  name                = var.appliaction_insights_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resouce-group.name
  application_type    = var.web
}