resource "google_service_account" "scheduler" {
  project      = data.google_project.this.project_id
  account_id   = "gcf-sa-jw"
  display_name = "Job Scheduler Service Account"
}
