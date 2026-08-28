resource "google_cloudfunctions2_function_iam_binding" "viewers" {
  count = length(var.function_viewers) == 0 ? 0 : 1

  project        = google_cloudfunctions2_function.core.project
  location       = google_cloudfunctions2_function.core.location
  cloud_function = google_cloudfunctions2_function.core.name
  role           = "roles/cloudfunctions.viewer"
  members        = var.function_viewers
}
