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
    environment_variables = var.env_vars
  }
}

data "google_project" "project" {
}

resource "google_kms_crypto_key_iam_member" "crypto_key" {
  crypto_key_id = var.key_id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "serviceAccount:service-${data.google_project.project.number}@gcf-admin-robot.iam.gserviceaccount.com"
}
