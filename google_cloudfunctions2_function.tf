resource "google_cloudfunctions2_function" "function" {
  name        = var.function_name
  location    = var.location
  description = "a new function"

  build_config {
    runtime     = "go121"
    entry_point = "HelloHTTP" # Set the entry point
    source {
      storage_source {
        bucket = google_storage_bucket.bucket.name
        object = google_storage_bucket_object.archive.name
      }
    }
  }

  service_config {
    min_instance_count    = 1
    available_memory      = "256M"
    timeout_seconds       = 60
    service_account_email = google_service_account.account.email
  }
}