resource "google_storage_bucket" "bucket" {
  #checkov:skip=CKV_GCP_62
  name                        = "${data.google_project.project.name}-lambdacode-bucket"
  location                    = "us-central1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }
}
