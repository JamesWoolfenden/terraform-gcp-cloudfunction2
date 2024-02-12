#required


resource "google_service_account" "account" {
  account_id   = "gcf-sa"
  display_name = "Test Service Account"
}
