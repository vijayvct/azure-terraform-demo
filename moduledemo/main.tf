terraform {
  required_providers {
    azurerm={
        source="hashicorp/azurerm"
        version=">=2.0.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source ="./ResourceGroup"
  base_name = "TerraformModule"
  location = "West US"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "TerrformExample"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}