terraform {

   required_providers {
     azurerm = {
       source  = "hashicorp/azurerm"
       version = "~>2.0"
     }
     random = {
       source  = "hashicorp/random"
       version = "~>3.0"
     }
   }
 }

 provider "azurerm" {
   features {}
 }

 resource "azurerm_resource_group" "rg" {
   location = "eastus"
   name     = "string"
 }


