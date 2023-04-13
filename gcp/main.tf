terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("class-adv2023-kasys-2d7ca4146e6d.json")
  project = "class-adv2023-kasys"
  region  = "us-east1"
  zone    = "us-east1-c"
}