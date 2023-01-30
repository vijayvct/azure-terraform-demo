variable "storage_account_name" {
  type = string
  description = "Storage Account Name"
  default = "tfstorage"
}

variable "resource_group"{
    type = string
    description = "Resource Group"
    default = "demo-rg"
}

variable "storage_regions" {
  type=list(string)
  description = "Regions for Storage account creation"
  default = ["East US","West US","Central US"]
}

variable "replication" {
  type = list(string)
  description = "Replication Type for Storage Account"
  default = [ "LRS","GRS","ZRS" ]
}