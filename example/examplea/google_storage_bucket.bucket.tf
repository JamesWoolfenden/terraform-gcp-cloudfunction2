# holden:ignore:HLD_GCP_003
resource "google_storage_bucket" "code" {
  #checkov:skip=CKV_GCP_62
  name                        = "${data.google_project.this.name}-lambdacode-bucket"
  location                    = "us-central1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  encryption {
    default_kms_key_name = google_kms_crypto_key.pike.id
  }

  versioning {
    enabled = true
  }
}
