terraform {
  backend "azurerm" {
    resource_group_name  = "epicbook-tfstate-rg"
    storage_account_name = "epicbooktfstate3657"
    container_name       = "epibooktfstate"
    key                  = "azure-infra-epicbook.tfstate"
    use_azuread_auth     = true
  }
}
