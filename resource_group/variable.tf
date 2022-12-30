variable "resource_group" {
     
}

variable "resource_location" {
   
}

variable "tags" {
 description = "tags reference purpose"
 type        = map

 default = {
    Environment = "dev"
    Location    = "Central India"
    Name        = "resource_group"
    
 }
}