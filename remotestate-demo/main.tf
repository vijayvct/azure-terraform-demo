terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm={
      source="hashicorp/azurerm"
      version=">=2.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "terraformstate-rg"
    storage_account_name = "terraformstate202320"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}

#create a resource group
resource "azurerm_resource_group" "demo" {
  name="test1-rg"
  location = "West US"
}

resource "azurerm_storage_account" "example" {
  name                     = "ctstorage25012023"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "example1" {
  name                     = "ctstorage30012023"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}