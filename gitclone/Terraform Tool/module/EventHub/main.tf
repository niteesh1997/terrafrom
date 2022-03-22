data "azurerm_resource_group" "resouce-group-eventhub" {
  name = var.resource_group_name

}

resource "azurerm_eventhub_namespace" "azure-eventhubnamespace" {
  count               = var.create_eventhub_namespace == true ? 1 : 0
  name                = var.eventhub_namespace_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resouce-group-eventhub.name
  sku                 = var.sku1
  capacity            = var.capacity
}

resource "azurerm_eventhub" "test-eventhub" {
  count               = var.create_eventhub == true ? 1 : 0
  name                = var.eventhub_name
  namespace_name      = azurerm_eventhub_namespace.azure-eventhubnamespace[count.index].name
  resource_group_name = data.azurerm_resource_group.resouce-group-eventhub.name
  partition_count     = var.partition_count
  message_retention   = var.message_retention
}
