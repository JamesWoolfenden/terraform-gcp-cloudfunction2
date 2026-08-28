resource "google_cloud_run_service_iam_binding" "invokers" {
  count = length(var.run_invokers) == 0 ? 0 : 1

  project  = google_cloudfunctions2_function.core.project
  location = google_cloudfunctions2_function.core.location
  service  = google_cloudfunctions2_function.core.name
  role     = "roles/run.invoker"
  members  = var.run_invokers
}
