#Terraform Settings Block 
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm={
      source="hashicorp/azurerm"
      version=">=2.0" #optional 
    }
    random={
      source = "hashicorp/random"
      version = "2.3.0"
    }
  }
}

#Configure the Microsoft Azure Provider
provider "azurerm" {
  features {    
  }
}

# resource "random_id" "storage_id" {
#   byte_length = 8
# }

resource "random_string" "str_name" {
  length=4
}

resource "azurerm_storage_account" "demostorage" {
  #name = "${var.storage_account_name}${random_string.str_name}"
  name="teststorage2023201"
  resource_group_name = var.resource_group
  location = var.storage_regions[0]
  account_tier = "Standard"
  account_replication_type = var.replication[0]

  tags= local.common_tags
}

resource "azurerm_storage_account" "demostorage1" {
  name="teststorage2023202"
  resource_group_name = var.resource_group
  location = var.storage_regions[0]
  account_tier = "Standard"
  account_replication_type = var.replication[0]

  tags=local.common_tags
}

resource "azurerm_storage_account" "demostorage2" {
 name="teststorage2023203"
  resource_group_name = var.resource_group
  location = var.storage_regions[0]
  account_tier = "Standard"
  account_replication_type = var.replication[0]

  tags=local.common_tags
}

