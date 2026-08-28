# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "function2" {
  source                       = "../../"
  location                     = "us-central1"
  project                      = data.google_project.this.project_id
  source_zip_path              = data.archive_file.golang.output_path
  schedule                     = "0 0 1 * *" # MONTHLY
  function_name                = "btdelete"
  entry_point                  = "btDeleter" # Set the entry point
  key_id                       = google_kms_crypto_key.pike.id
  kms_key_name                 = google_kms_crypto_key.pike.id
  env_vars                     = {}
  body                         = base64encode(jsonencode({ "projectid" : "pangpt", "instanceid" : "pangpt", "tableid" : "pangpt", "filter" : ".*chat_histories$", "days" : "90", "dryrun" : true }))
  bucketname                   = google_storage_bucket.code.name
  serviceaccount_email         = google_service_account.scheduler.email
  invoker_serviceaccount_email = google_service_account.invoker.email
  secrets = [{
    "key"     = "NAME"
    "secret"  = "PASSWORD"
    "version" = "latest"
  }]

  depends_on = [
    google_kms_crypto_key_iam_member.crypto_key,
    google_kms_crypto_key_iam_member.crypto_key_gcs,
  ]
}


data "google_project" "this" {
  project_id = "pike-477416"
}

resource "google_kms_key_ring" "pike" {
  project  = data.google_project.this.project_id
  location = "us-central1"
  name     = "pike"
}

resource "google_kms_crypto_key" "pike" {
  #checkov:skip=CKV_GCP_82:testdata
  key_ring        = google_kms_key_ring.pike.id
  name            = "pike"
  rotation_period = "7776000s"

  lifecycle {
    prevent_destroy = true
  }
}
