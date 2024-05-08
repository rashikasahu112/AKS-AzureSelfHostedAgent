terraform {
  backend "azurerm" {
    resource_group_name  = "rg"
    storage_account_name = "storageaccountblackbaud"
    container_name       = "terraform-acr"
    key                  = "terraform.tfstate"
  }
}