terraform {
   required_providers {
     azurerm = {
       source  = "hashicorp/azurerm"
       version = "~>2.0"
     }
   }
 }

 provider "azurerm" {
   features {}
 }


resource "azurerm_resource_group" "resource_group1" {
    name = "resource-group-1"
    location = "canada-central"
}

resource "azurerm_storage_account" "storage-account1" {
    name = "storageaccount1"
    resource_group_name = azurerm_resource_group.resource_group1.name
    location = azurerm_resource_group.resource_group1.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
      name = "first-sa"
    }
}

resource "azurerm_storage_account" "storage-account2" {
    name = "storageaccount2"
    resource_group_name = azurerm_resource_group.resource_group1.name
    location = azurerm_resource_group.resource_group1.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    depends_on = [azurerm_storage_account.storage-account1]

    tags = {
      name = "second-sa"
    }
}