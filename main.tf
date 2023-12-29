terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    subscription_id      = "9df535e2-a77e-488d-bb66-817d29e9067e"
    resource_group_name  = "GitHub_RG"
    storage_account_name = "terraformgithubactions23"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    skip_provider_registration = "true"
    #use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  #use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
