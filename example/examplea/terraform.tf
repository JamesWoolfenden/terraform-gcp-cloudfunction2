terraform {
  required_providers {
    google = {
      version = "5.15.0"
      source  = "hashicorp/google"
    }
  }
  required_version = ">= 1.3.5"
}
