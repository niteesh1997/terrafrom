# Defined Resource Group
data "azurerm_resource_group" "resourcegroup" {
  name = var.resource_group_name
}

data "azurerm_application_insights" "example" {
 #count               = length(var.appliaction_insights_name)
  name                = var.appliaction_insights_name
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
}

data "azurerm_subnet" "func_pep_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.resourcegroup.name
}

data "azurerm_app_service_plan" "app-service-plan" {
  name                  = var.app_service_plan_name          
  resource_group_name   = data.azurerm_resource_group.resourcegroup.name
}
# Defined Azure Storage Account

data "azurerm_storage_account" "storageacc2"{
  name                = var.storageaccount_name
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
}

# Defined Creation Of Function-App

resource "azurerm_function_app" "functionapp" {
  #count                          = var.create_functionapp == true ? 1 : 0
  name                           = var.functionapp_name
  location                       = var.location
  resource_group_name            = data.azurerm_resource_group.resourcegroup.name
  app_service_plan_id            = data.azurerm_app_service_plan.app-service-plan.id
  storage_account_name           = data.azurerm_storage_account.storageacc2.name
  storage_account_access_key     = data.azurerm_storage_account.storageacc2.primary_access_key
  app_settings = {
   "APPINSIGHTS_INSTRUMENTATIONKEY"          = data.azurerm_application_insights.example.instrumentation_key
   "APPLICATIONINSIGHTS_CONNECTION_STRING"   = data.azurerm_application_insights.example.connection_string
  }
}
# Creating FunctionApp-private-endpoint
resource "azurerm_private_endpoint" "funcapp-pep-connection" {
 #count               = var.create_functapp_connection == true ? 1 : 0
  name                = var.func_pep_name
  location            = data.azurerm_resource_group.resourcegroup.location
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  subnet_id           = data.azurerm_subnet.func_pep_subnet.id

  private_service_connection {
    name                           =  "${var.func_pep_name}-connection"  
    private_connection_resource_id = azurerm_function_app.functionapp.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }
  depends_on                       = [data.azurerm_storage_account.storageacc2]
}


resource "azurerm_private_endpoint" "storage_blob" {
  #count               = var.create_functapp_connection == true ? 1 : 0
  name                = var.storageblob_pep_name
  location            = data.azurerm_resource_group.resourcegroup.location
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  subnet_id           = data.azurerm_subnet.func_pep_subnet.id

  private_service_connection {
    name                           = "${var.storageblob_pep_name}-connection"  
    private_connection_resource_id = data.azurerm_storage_account.storageacc2.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
  depends_on                        = [data.azurerm_storage_account.storageacc2]
}

resource "azurerm_private_endpoint" "storage_table_pep" {
	  count               = var.create_functapp_connection == true ? 1 : 0
	  name                = var.storagetable_pep_name
	  location            = data.azurerm_resource_group.resourcegroup.location
	  resource_group_name = data.azurerm_resource_group.resourcegroup.name
	  subnet_id           = data.azurerm_subnet.func_pep_subnet.id

	  private_service_connection {
		name                           = "${var.private_service_name}-connection"  
		private_connection_resource_id = data.azurerm_storage_account.storageacc2.id
		is_manual_connection           = false
		subresource_names              = ["table"]
	}
  depends_on                        = [data.azurerm_storage_account.storageacc2]
}


resource "azurerm_private_endpoint" "pep_storage_file" {
  #count               = var.create_functapp_connection == true ? 1 : 0
  name                = var.pep_storage_share_file_name
  location            = data.azurerm_resource_group.resourcegroup.location
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  subnet_id           = data.azurerm_subnet.func_pep_subnet.id

  private_service_connection {
    name                           = "${var.pep_storage_share_file_name}-connection"  
    private_connection_resource_id = data.azurerm_storage_account.storageacc2.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }
  depends_on                        = [data.azurerm_storage_account.storageacc2]
}