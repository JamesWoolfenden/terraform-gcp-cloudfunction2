resource "google_cloudfunctions2_function" "function" {
  name        = var.function_name
  location    = var.location
  description = "a new function"

  build_config {
    runtime     = "go121"
    entry_point = var.entry_point
    source {
      storage_source {
        bucket = var.bucketname
        object = google_storage_bucket_object.archive.name
      }
    }
  }

  service_config {
    min_instance_count    = 1
    available_memory      = "256M"
    timeout_seconds       = 60
    service_account_email = google_service_account.account.email
    environment_variables = var.env_vars
  }
}

data "google_project" "project" {
}




variable "entry_point" {
  type = string
}
