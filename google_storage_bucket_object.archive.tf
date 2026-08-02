resource "google_storage_bucket_object" "archive" {
  name         = "${var.function_name}-${random_string.name.result}.zip"
  bucket       = var.bucketname
  source       = var.source_zip_path
  kms_key_name = var.kms_key_name
}

resource "random_string" "name" {
  length  = 8
  special = false
  upper   = false
  keepers = {
    md5 = filemd5(var.source_zip_path)
  }
}
