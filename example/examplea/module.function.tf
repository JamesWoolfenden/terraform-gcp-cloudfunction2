module "function2" {
  source               = "../../"
  location             = "us-central1"
  project              = data.google_project.project.project_id
  source_zip_path      = data.archive_file.golang.output_path
  schedule             = "0 0 1 * *" # MONTHLY
  function_name        = "btdelete"
  entry_point          = "btDeleter" # Set the entry point
  key_id               = "projects/${data.google_project.project.project_id}/locations/us-central1/keyRings/pangpt_kms_key_ring/cryptoKeys/pangpt_kms_crypto"
  env_vars             = {}
  body                 = base64encode(jsonencode({ "projectid" : "pangpt", "instanceid" : "pangpt", "tableid" : "pangpt", "filter" : ".*chat_histories$", "days" : "90", "dryrun" : true }))
  bucketname           = google_storage_bucket.bucket.name
  serviceaccount_email = google_service_account.account.email
}


data "google_project" "project" {
  project_id = "pike-412922"
}


# resource "google_bigtable_instance_iam_member" "reader" {
#   instance = "pangpt"
#   role     = "roles/bigtable.user"
#   member   = "serviceAccount:${google_service_account.account.email}"
# }

resource "google_kms_key_ring" "pike" {
  location = "europe-west2"
  name     = "pike-uk"
}

resource "google_kms_crypto_key" "pike" {
  #checkov:skip=CKV_GCP_82:testdata

  key_ring        = google_kms_key_ring.pike.id
  name            = "pike"
  rotation_period = "7776000s"
}
