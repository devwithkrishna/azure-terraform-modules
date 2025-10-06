terraform {
  required_version = "~> 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 4.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1"
    }

  }
}
provider "azurerm" {
  features {}
}

provider "time" {}