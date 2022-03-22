

sub_id    = "a12ecb5c-6043-4acb-8e60-d48e89e3e262"
tenant_id = "76a2ae5a-9f00-4f6b-95ed-5d33d77c4d61"

# Module for app-service plan
appservice_plan_list = ["plan-289123301204"]
tier                 = "Premium"
size                 = "P1"
# Module app-service plan end


# Module App-Service Start
appservice_list = {
  appservice1 = {
    appservice_name           = "appservicename1037770"
    app_service_plan_name     = "plan-289123301204"
    appliaction_insights_name = "tf-test-appinsights239283"
    pp_endpoint_name          = "pp-test-appservice-1234"
    subnet_name               = "subnet-0"
    vnet_name                 = "Vnet-8623491624981"
  }
  appservice2 = {
    appservice_name           = "appservicename1037771"
    app_service_plan_name     = "plan-289123301204"
    appliaction_insights_name = "tf-test-appinsights239283"
    pp_endpoint_name          = "pp-test-appservice-1235"
    subnet_name               = "subnet-0"
    vnet_name                 = "Vnet-8623491624981"
  }
}

resource_group_name = "Terraform_Accelerator"
location            = "Central India"
# Module App-Service End

Vnet_list = {

  Vnet = {
    create_network_securitygroup = true
    create_virtual_network       = true
    network_security_group_name  = "network-security-group-238752385"
    vnet_name                    = "Vnet-8623491624981"
    vnet_env                     = "Production"
    subnet_name                  = ["subnet-0", "subnet-1", "subnet-2"]          #Add subnet_name here
    subnet_addprefix_name        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.4.0/24"] #Add subnet_range here

  }

}
add_space_name  = ["10.0.0.0/16"]
dns_server_name = ["10.0.0.4", "10.0.0.5"]



# appinsight
web                       = "web"
appliaction_insights_list = ["tf-test-appinsights239283"]

# Module Function-App Start
functionapp_list = {
  function_app1 = {
    storageaccount_name         = "sc6837109309"
    create_storage_account      = true
    create_functionapp          = true
    functionapp_name            = "functionapp2307790214"
    app_service_plan_name       = "plan-289123301204"
    appliaction_insights_name   = "tf-test-appinsights239283"
    func_pep_name               = "func_pep_name1"
    subnet_name                 = "subnet-0"
    vnet_name                   = "Vnet-8623491624981"
    create_functapp_connection  = true
    private_service_name        = "example-privateserviceconnection1"
    storagetable_name           = "storagetable2468"
    storagetable_pep_name       = "Storage_pep_name2468"
    container_name              = "container1654624"
    storageblob_name            = "storageblob_name2468"
    storageblob_pep_name        = "storageblob_pep_2468"
    storage_share_name          = "storageshare-273812"
    quota                       = "50"
    storage_share_file_name     = "my-awesometechnologygroup-content.zip"
    pep_storage_share_file_name = "pep_storage_share_file4172423"
  }
  function_app2 = {
    storageaccount_name         = "sc65801117109"
    create_appservice_plan      = true
    create_storage_account      = true
    create_functionapp          = true
    functionapp_name            = "functionapp23023713214"
    app_service_plan_name       = "plan-289123301204"
    appliaction_insights_name   = "tf-test-appinsights239283"
    func_pep_name               = "func_pep_name2"
    subnet_name                 = "subnet-1"
    vnet_name                   = "Vnet-8623491624981"
    create_functapp_connection  = true
    private_service_name        = "example-privateserviceconnection2"
    storagetable_name           = "storagetable1357"
    storagetable_pep_name       = "Storage_pep_name1357"
    container_name              = "container16546298"
    storageblob_name            = "storageblob_name1357"
    storageblob_pep_name        = "storageblob_pep_1357"
    storage_share_name          = "storageshare-27382910"
    quota                       = "50"
    storage_share_file_name     = "my-awesomenewtechnologygroup-content.zip"
    pep_storage_share_file_name = "pep_storage_share_file4172424"
  }
}
ac_type = "LRS"
# Module Function-App End


# Module API Management Start
api_management_list = {
  api_management1 = {
    create_api          = true
    api_management_name = "api-21333833"
    publisher_name      = "My Company641418"
    publisher_email     = "abcsdgcompany@terraform.io"

  }

  api_management2 = {
    create_api          = true
    api_management_name = "api-123961"
    publisher_name      = "webtechnology641412128"
    publisher_email     = "xyzcompany@terraform.io"

  }

}
sku = "Developer_1"
# Module API Management Start


# Storage Account Start
storatgeaccount_list = {

  storageaccount1 = {
    create_storageacc   = true
    storageaccount_name = "sc65801117109"
  }


  storageaccount2 = {
    create_storageacc   = true
    storageaccount_name = "sc6837109309"
  }
}

# Storage Account End


# Module Event-Hub Start
eventhub_list = {

  eventhub1 = {
    create_eventhub_namespace = true
    eventhub_namespace_name   = "eventhub-namespace2138512491"
    create_eventhub           = true
    eventhub_name             = "eventhub-2336219182"

  }
  eventhub2 = {
    create_eventhub_namespace = true
    eventhub_namespace_name   = "eventhub-namespace238117903"
    create_eventhub           = true
    eventhub_name             = "eventhub-038110233"

  }

}

capacity          = 1
partition_count   = 2
message_retention = 1
sku1              = "standard"

# Module Event-Hub End

# Module Key_vault Start
Key_vault_list = {

  Key_vault1 = {
    createkeyvault = true
    keyvaultname   = "keyvault2639684"
    enabledisk     = true
  }

  Key_vault2 = {
    createkeyvault = true
    keyvaultname   = "keyvault229371712904"
    enabledisk     = true
  }

}

# Module Key_vault End

# Module Eventgrid start

eventgrid_topic_list = {

  evnetgrid_topic1 = {
    create_eventgrid_topic = true
    eventgrid_topic_name   = "my-eventgrid-topic29813"
    tags                   = "production"

  }

  evnetgrid_topic2 = {
    create_eventgrid_topic = true
    eventgrid_topic_name   = "my-eventgrid-topic2130233"
    tags                   = "development"

  }

}

# Module Eventgrid End

# Module servicebus_namespace start
servicebus_namespace_list = {
  servicebus1 = {
    enable_servicebus_namespace = true
    servicebus_namespace_name   = "tfex-servicebus-namespace28631236"
  }

}
skuservicebus         ="Standard"
# Module servicebus_namespace End


# Module redis_cache start
redis_cache_list = {
  redis_cache1 = {
    enable_redis_cache            = true
    redis_cache_name              = "redis-cache82636182328"      
    capacity                      = 2
    family                        = "C"
    sku_redis_cache               = "Standard"
    non_ssl_port                  = false
    minimum_tls_version           = "1.2"
  }

}

# Module redis_cache End


# Module Load_balancer Start

load_balancer_list = {
  load_balancer1 = {
    azurerm_public_ip = "PublicIP"
    allocation_method = "static"
    api_load_balancer = "api-load-balancer"
  }

}

#module virtual_machine
networkinterface = "tfvmex-nicc"
ip_config = "testconfiguration1"
private_ip = "Dynamic"
virtualmachine = "tfvmex-vm"
vm_size = "Standard_DS1_v2"
storage_os = "myosdisk1"
caching = "ReadWrite"
create_option = "FromImage"
managed_disk = "Standard_LRS"
auth = "false"
envi  = "stagging"
publisher = "Canonical"
offer = "UbuntuServer"
sku_vm = "16.04-LTS"

computername = "hostname"
admin_user = "testadmin"
admin_pass = "Password1234!"