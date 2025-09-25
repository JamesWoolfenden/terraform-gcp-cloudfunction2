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
    min_instance_count    = var.min_instance_count
    max_instance_count    = var.max_instance_count
    available_memory      = var.available_memory
    timeout_seconds       = var.timeout_seconds
    service_account_email = var.serviceaccount_email
    environment_variables = var.env_vars

    dynamic "secret_environment_variables" {
      for_each = var.secrets
      content {
        key        = secret_environment_variables.value["key"]
        project_id = var.project
        secret     = secret_environment_variables.value["secret"]
        version    = secret_environment_variables.value["version"]
      }
    }
  }
}
