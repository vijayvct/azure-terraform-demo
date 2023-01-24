terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm={
      source="hashicorp/azurerm"
      version=">=2.0"
    }
  }
}

provider "azurerm" {
  features{}
}



resource "azurerm_resource_group" "my-resource-group" {
  name     = "${var.prefix}-resources"
  location = "West US"
}

resource "azurerm_network_security_group" "my-nsg" {
  name                = "${var.prefix}-security-group"
  location            = azurerm_resource_group.my-resource-group.location
  resource_group_name = azurerm_resource_group.my-resource-group.name
}

resource "azurerm_virtual_network" "my-vnet" {
  name                = "${var.prefix}-network"
  location            = azurerm_resource_group.my-resource-group.location
  resource_group_name = azurerm_resource_group.my-resource-group.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.my-nsg.id
  }

  tags = {
    environment = "Production"
  }
}

output "my-network" {
  value=azurerm_virtual_network.my-vnet
}