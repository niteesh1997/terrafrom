# App Service Resource Group Variable 
variable "resource_group_name" {}

variable "location" {}

# App Service Service Variable 
variable "appservice_name" {}

variable "app_service_plan_name" {}

variable "appliaction_insights_name" {
  type = string
}

variable "vnet_name" {}
variable "pp_endpoint_name" {}
variable "subnet_name" {}
