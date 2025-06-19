resource "google_cloudfunctions2_function" "function" {
  #checkov:skip=CKV_GCP_124:testdata

  name        = var.function_name
  location    = var.location
  project     = var.project
  description = "a new function"

  build_config {
    runtime     = var.runtime
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
    service_account_email = var.serviceaccount_email
    environment_variables = var.env_vars
  }
}
