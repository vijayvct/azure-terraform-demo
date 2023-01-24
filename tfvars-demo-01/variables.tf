variable "prefix"{
    default = "ct"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
}

variable "location" {
  type=string
  description="Location for the resources"
}

variable "nsg" {
  type=string
  description="Network Security Group"
}

variable "vnet" {
  type=string
  description="Virtual Network"
}

variable "environment" {
  type = string
  description = "Enviornment"
}