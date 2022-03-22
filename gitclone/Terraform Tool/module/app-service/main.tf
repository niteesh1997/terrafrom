data "azurerm_resource_group" "resouce-group" {
  name                 = var.resource_group_name
}

data "azurerm_application_insights" "example" {
  count                 = length(var.appliaction_insights_name)
  name                  = var.appliaction_insights_name          
  resource_group_name   = data.azurerm_resource_group.resouce-group.name
}

data "azurerm_app_service_plan" "appplan" {
  name                  = var.app_service_plan_name          
  resource_group_name   = data.azurerm_resource_group.resouce-group.name
}


# Defined Creation Of Azureapp Service
resource "azurerm_app_service" "appservice" {
  name                  = var.appservice_name
  location              = data.azurerm_resource_group.resouce-group.location
  resource_group_name   = data.azurerm_resource_group.resouce-group.name
  app_service_plan_id   = data.azurerm_app_service_plan.appplan.id

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"          = data.azurerm_application_insights.example[0].instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"   = data.azurerm_application_insights.example[0].connection_string
  }
}

data "azurerm_subnet" "pp_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.resouce-group.name
}

resource "azurerm_private_endpoint" "pp_endpoint" {
  name                =  var.pp_endpoint_name
  location            = data.azurerm_resource_group.resouce-group.location
  resource_group_name = data.azurerm_resource_group.resouce-group.name
  subnet_id           = data.azurerm_subnet.pp_subnet.id

  private_service_connection {
    name                           = "${var.pp_endpoint_name}-connection"
    private_connection_resource_id = azurerm_app_service.appservice.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }
}