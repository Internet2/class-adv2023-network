provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
  subscription_id = var.az_subscription_id
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}