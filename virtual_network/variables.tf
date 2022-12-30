variable "resource_group" {
    type = string
     
}
variable "resource_location" {
   default = "centralindia"
   
}

variable "virtual_network_name" {
}

variable "network_address_space" {
}

variable "app_subnet_address_prefix" {
}

variable "app_subnet_address_name" {
}

variable "mangment_subnet_address_prefix" {
}

variable "mangment_subnet_address_name" {
}

variable "database_subnet_address_prefix" {
}

variable "database_subnet_address_name" {
}

variable "environment" {
}
