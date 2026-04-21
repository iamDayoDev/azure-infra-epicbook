terraform {
  # These backend resources must already exist before `terraform init` runs.
  backend "azurerm" {
    resource_group_name  = "epicbook-tfstate-rg"
    storage_account_name = "epicbooktfstate3657"
    container_name       = "tfstate"
    key                  = "azure-infra-epicbook.tfstate"
  }
}
