###########################################################################
# Azure Bastion Service creation
###########################################################################

data "azurerm_resource_group" "resource_group" {
  name = "${var.resource_group}-rg"
  
}

data "azurerm_client_config" "current" {}


data "azurerm_virtual_network" "virtual_network" {
    name = var.virtual_network_name
    resource_group_name = data.azurerm_resource_group.resource_group.name
  
}
###############################################################################
##Azure Bastion can only be created in subnet with name 'AzureBastionSubnet
###############################################################################
resource "azurerm_subnet" "bastion_subnet" {
  name                 = var.bastion_subnet_address_name
  resource_group_name  = data.azurerm_resource_group.bastion_resource_group.name
  virtual_network_name = data.azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.bastion_subnet_address_prefix
}



resource "azurerm_public_ip" "pubip" {
  name                = "${var.bastion_name}-PUBIP"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  allocation_method   = var.ip_allocation
  sku                 = var.sku

}

# create bastion host
resource "azurerm_bastion_host" "bastion" {
  name                = "${var.bastion_name}-host"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  tags                = var.bastion_tags


  ip_configuration {
    name                 = "${var.bastion_name}-configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.pubip.id
  }

}