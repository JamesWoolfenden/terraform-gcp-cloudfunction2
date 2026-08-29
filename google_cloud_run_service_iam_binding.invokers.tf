resource "google_cloud_run_service_iam_binding" "invokers" {
  project  = google_cloudfunctions2_function.core.project
  location = google_cloudfunctions2_function.core.location
  service  = google_cloudfunctions2_function.core.name
  role     = "roles/run.invoker"
  members  = concat(["serviceAccount:${var.invoker_serviceaccount_email}"], var.run_invokers)
}
