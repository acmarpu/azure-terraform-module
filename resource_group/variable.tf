#############################################################
# This main Resource Variable defined for all resources
#############################################################
variable "resource_group" {
     
}
variable "resource_location" {
   
}

###########################################################
# this tags Variable declaration for all resources
###########################################################
variable "tags" {
 description = "tags reference purpose"
 type        = map

 default = {
    Environment = "Devlopment"
    Location    = "Central India"
    Name        = "resource_group"
    
 }
}