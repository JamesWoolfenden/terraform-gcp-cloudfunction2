resource "google_cloud_scheduler_job" "invoke_cloud_function" {
  name        = var.job_name
  description = "Schedule the HTTPS trigger for cloud function"
  schedule    = var.schedule
  time_zone   = var.time_zone
  project     = google_cloudfunctions2_function.function.project
  region      = google_cloudfunctions2_function.function.location

  http_target {
    uri         = google_cloudfunctions2_function.function.service_config[0].uri
    http_method = "POST"
    oidc_token {
      audience              = "${google_cloudfunctions2_function.function.service_config[0].uri}/"
      service_account_email = google_service_account.account.email
    }
  }
}
