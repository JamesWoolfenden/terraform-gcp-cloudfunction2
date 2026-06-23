# holden:ignore:HLD_TF_004
terraform {
  required_providers {

    archive = {
      source  = "hashicorp/archive"
      version = "2.7.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.30.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
  required_version = ">= 1.5.0"
}
