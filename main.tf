#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Terraform Block

terraform {
    required_providers  {
        azurerm =   {
            source  =   "hashicorp/azurerm"
        }
    }  
    backend "azurerm" {
    resource_group_name  = "TF"
    storage_account_name = "terraform121"
    container_name       = "terrqa"
    key                  = "prod.terraform.tfstate"
  }
}

# Provider Block

provider "azurerm" {
    version         =   "~> 2.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}

resource "azurerm_resource_group" "rg1" {
  location = "East US"
  name     = "sunny-rg"
}

resource "azurerm_virtual_network" "VNet1" {
  name                = "VNet1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
