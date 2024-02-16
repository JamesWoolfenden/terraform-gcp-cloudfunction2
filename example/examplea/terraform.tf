terraform {
  required_providers {
    google = {
      version = "5.15.0"
      source  = "hashicorp/google"
    }
    random = {
      version = "3.6.0"
      source  = "hashicorp/random"
    }
    archive = {
      version = "2.4.2"
      source  = "hashicorp/archive"
    }

  }
  required_version = ">= 1.3.5"
}
