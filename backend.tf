##########################################################
# Configure azurerm backend
###########################################################
terraform {   
    backend "azurerm" {
        resource_group_name   = var.backend_resource_group
        storage_account_name  = var.backend_storage
        container_name        = var.backend_container_name
        key                   = var.backend_key
    }
}