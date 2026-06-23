resource "google_cloud_run_service_iam_member" "invoker" {
  project  = google_cloudfunctions2_function.core.project
  location = google_cloudfunctions2_function.core.location
  service  = google_cloudfunctions2_function.core.name
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.invoker_serviceaccount_email}"
}
