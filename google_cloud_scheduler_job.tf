resource "google_cloud_scheduler_job" "invoke_cloud_function" {
  name        = var.job_name
  description = "Schedule the HTTPS trigger for cloud function"
  schedule    = var.schedule
  time_zone   = var.time_zone
  project     = google_cloudfunctions2_function.function.project
  region      = google_cloudfunctions2_function.function.location

  http_target {
    body        = var.body
    uri         = google_cloudfunctions2_function.function.url
    http_method = "POST"
    oidc_token {
      audience              = "${google_cloudfunctions2_function.function.service_config[0].uri}/"
      service_account_email = var.serviceaccount_email
    }
  }

  retry_config {
    max_backoff_duration = var.retry_config.max_backoff_duration
    max_doublings        = var.retry_config.max_doublings
    max_retry_duration   = var.retry_config.max_retry_duration
    min_backoff_duration = var.retry_config.min_backoff_duration
    retry_count          = var.retry_config.retry_count
  }
}
