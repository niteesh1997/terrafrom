data "azurerm_resource_group" "resoucegroupeventgrid" {
  name = var.resource_group_name

}

resource "azurerm_eventgrid_topic" "eventgridtopic1" {
  count               = var.create_eventgrid_topic == true ? 1 : 0
  name                = var.eventgrid_topic_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resoucegroupeventgrid.name

  tags = {
    environment = var.tags
  }
}
