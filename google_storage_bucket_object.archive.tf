resource "google_storage_bucket_object" "archive" {
  name   = "${var.function_name}-${random_string.name.result}.zip"
  bucket = google_storage_bucket.bucket.name
  source = var.source_zip_path
}

resource "random_string" "name" {
  length  = 8
  special = false
  upper   = false
  keepers = {
    md5 = filemd5(var.source_zip_path)
  }
}
