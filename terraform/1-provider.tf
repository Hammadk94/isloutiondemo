# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "FinanceAgentFiverr "
  region  = "us-east1-b"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "isolution-tf-state-staging"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
