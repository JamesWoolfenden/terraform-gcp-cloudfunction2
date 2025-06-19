resource "google_service_account" "account" {
  account_id   = "gcf-sa-jw"
  display_name = "Job Scheduler Service Account"
}
