terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.18.0"
    }
  }
}

provider "azurerm" {
  
  features {}

  subscription_id = "a731c7ca-b92e-4d2f-a4b7-c7d307b986be"
  tenant_id       = "665b6c62-7310-4d39-9abb-32a0cbc3b90f"
  client_id       = "d5470af2-324e-4d77-8298-abc977332349"
  client_secret   = "6W18Q~-6b1Pg51Ib2kuYxYGJ1y~nHM0oJ_7JEdwq"
}

variable "resource_group_names" {
  type    = map
  default = {
    dev  = "dev-rg"
    test = "test-rg"
    prod = "prod-rg"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_names[terraform.workspace]
  location = "westeurope"
}