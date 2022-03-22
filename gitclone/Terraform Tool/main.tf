/*
# Module AppService-PLAN Start
module "app-serviceplan" {
source                      = "./module/app-serviceplan"
for_each                    = toset(var.appservice_plan_list)
resource_group_name         = var.resource_group_name
app_service_plan_name       = each.value
tier                        = var.tier
size                        = var.size
location                    = var.location 
}

# Module AppService START
module "app-service" {
  source                     = "./module/app-service" # Getting Path of Appservice Module
  for_each                   = var.appservice_list
  appservice_name            = each.value.appservice_name
  app_service_plan_name      = each.value.app_service_plan_name
  resource_group_name        = var.resource_group_name
  location                   = var.location 
  depends_on                 = [module.app-serviceplan, module.Application_insight]
  appliaction_insights_name  = each.value.appliaction_insights_name
  pp_endpoint_name           = each.value.pp_endpoint_name
  subnet_name                = each.value.subnet_name
  vnet_name                  = each.value.vnet_name
}
# Module AppService End*/


# Vnet Module Start
module "vnet" {
  source                       = "./module/vnet"
  for_each                     = var.Vnet_list
  create_network_securitygroup = each.value.create_network_securitygroup
  create_virtual_network       = each.value.create_virtual_network
  network_security_group_name  = each.value.network_security_group_name
  vnet_name                    = each.value.vnet_name
  vnet_env                     = each.value.vnet_env
  subnet_name                  = each.value.subnet_name
  add_space_name               = var.add_space_name
  dns_server_name              = var.dns_server_name
  subnet_addprefix_name        = each.value.subnet_addprefix_name
  location                     = var.location
  resource_group_name          = var.resource_group_name

}
# Vnet Module End


/*#Application Insights Start
module "Application_insight" {
  source                         = "./module/Application_insight"
  for_each                       = toset(var.appliaction_insights_list)
  appliaction_insights_name      = each.value
  resource_group_name            = var.resource_group_name
  location                       = var.location
  web                            = var.web
}
#Application Insights END

# Functionapp Module Start 
module "function-app" {
  source                           = "./module/function-app"
  for_each                         = var.functionapp_list
  #functionsapp_storageaccount_name = each.value.functionsapp_storageaccount_name
  storageaccount_name              = each.value.storageaccount_name
  create_storage_account           = each.value.create_storage_account
  create_functionapp               = each.value.create_functionapp
  functionapp_name                 = each.value.functionapp_name
  func_pep_name                    = each.value.func_pep_name
  subnet_name                      = each.value.subnet_name
  vnet_name                        = each.value.vnet_name
  create_functapp_connection       = each.value.create_functapp_connection
  private_service_name             = each.value.private_service_name
  app_service_plan_name            = each.value.app_service_plan_name
  storagetable_name                = each.value.storagetable_name
  storagetable_pep_name            = each.value.storagetable_pep_name
  container_name                   = each.value.container_name
  storageblob_name                 = each.value.storageblob_name
  storageblob_pep_name             = each.value.storageblob_pep_name
  storage_share_name               = each.value.storage_share_name
  storage_share_file_name          = each.value.storage_share_file_name
  quota                            = each.value.quota
  pep_storage_share_file_name      = each.value.pep_storage_share_file_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tier                             = var.tier
  ac_type                          = var.ac_type
  size                             = var.size
  appliaction_insights_name        = each.value.appliaction_insights_name
  depends_on                       = [module.app-serviceplan,module.Application_insight,module.storage-account]
}
# Functionapp Module End

# Storage Account Start

module "storage-account" {
  source                          = "./module/storage-account"
  for_each                        = var.storatgeaccount_list
  create_storageacc               = each.value.create_storageacc
  storageaccount_name             = each.value.storageaccount_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  tier                            = var.tier
  ac_type                         = var.ac_type

}
# Storage Account End
/*
# API Mangement Start

module "api-management" {
  source                         = "./module/api-management"
  for_each                       = var.api_management_list
  create_api                     = each.value.create_api
  api_management_name            = each.value.api_management_name
  publisher_name                 = each.value.publisher_name
  publisher_email                = each.value.publisher_email
  location                       = var.location
  resource_group_name            = var.resource_group_name
  sku                            = var.sku
}
# API Mangement End


# Event-Hub Start

module "EventHub" {
  source                         = "./module/EventHub"
  for_each                       = var.eventhub_list
  eventhub_namespace_name        = each.value.eventhub_namespace_name
  eventhub_name                  = each.value.eventhub_name
  create_eventhub_namespace      = each.value.create_eventhub_namespace
  create_eventhub                = each.value.create_eventhub
  resource_group_name            = var.resource_group_name
  location                       = var.location
  sku1                           = var.sku1
  capacity                       = var.capacity
  partition_count                = var.partition_count
  message_retention              = var.message_retention

}
# Event-Hub End

# Key_Vault Start

module "Key-Vault" {
  source              = "./module/Key-Vault"
  for_each            = var.Key_vault_list
  createkeyvault      = each.value.createkeyvault
  keyvaultname        = each.value.keyvaultname
  enabledisk          = each.value.enabledisk
  resource_group_name = var.resource_group_name
  location            = var.location
  sku1                = var.sku1

}

# Key_Vault End

# Eventgrid Start
module "eventgrid" {
  source                 = "./module/eventgrid"
  for_each               = var.eventgrid_topic_list
  create_eventgrid_topic = each.value.create_eventgrid_topic
  eventgrid_topic_name   = each.value.eventgrid_topic_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  tags                   = each.value.tags
}
# Eventgrid End


# servicebus_namespace Start
module "servicebus_namespace" {
  source                      = "./module/servicebus_namespace"
  for_each                    = var.servicebus_namespace_list
  enable_servicebus_namespace = each.value.enable_servicebus_namespace
  servicebus_namespace_name   = each.value.servicebus_namespace_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  skuservicebus               = var.skuservicebus
}
# servicebus_namespace End

# redis_cache Start
module "redis_cache" {
  source              = "./module/redis_cache"
  for_each            = var.redis_cache_list
  enable_redis_cache  = each.value.enable_redis_cache
  capacity            = each.value.capacity
  redis_cache_name    = each.value.redis_cache_name
  family              = each.value.family
  non_ssl_port        = each.value.non_ssl_port
  sku_redis_cache     = each.value.sku_redis_cache
  minimum_tls_version = each.value.minimum_tls_version
  resource_group_name = var.resource_group_name
  location            = var.location
  
}
# redis_cache End


#load balancer start

/*module "load_balancer" {
  source              = "./module/Load_balancer"
  for_each            = var.load_balancer
  azurerm_public_ip   = for.each.azurerm_public_ip
  allocation_method   = for.each.allocation_method
  api_load_balancer   = for.each.api_load_balancer
  resource_group_name = var.resource_group_name
  location            = var.location
  
}
 # load balancer end*/

#virtual machine starts

module "virtual_machine" {
  source = "./module/virtual_machine"
  for_each = var.virtual_Machine_list
  resource_group_name    = var.resource_group_name
    vnet_name            = each.value.vnet_name
    subnet_name          = each.value.subnet_name
    networkinterface     = each.value.networkinterface
    location             = var.location
    virtualmachine       = each.value.virtualmachine
    vm_size              = each.value.vm_size
    storage_os           = each.value.storage_os
    caching              = each.value.caching
    create_option        = each.value.create_option
    managed_disk         = each.value.managed_disk
    auth                 = each.value.auth
    envi                 = each.value.envi
    publisher            = each.value.publisher
    offer                = each.value.offer
    sku_vm               = each.value.sku_vm
    computername         = each.value.computername
    admin_user           = each.value.admin_user
    admin_pass           = each.value.admin_pass
    ip_config            = each.value.ip_config
    private_ip           = each.value.private_ip
    depends_on = [module.vnet]

}

#virtual machine ends