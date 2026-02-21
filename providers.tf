terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.22.0, < 7.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east1"
}

terraform {
  cloud {
    organization = "ajay-lab-terraform"

    workspaces {
      name = "terraform-gcp-enterprise-lab"
    }
  }
}
