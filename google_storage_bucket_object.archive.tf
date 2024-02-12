resource "google_storage_bucket_object" "archive" {
  name   = basename(var.source_zip_path)
  bucket = google_storage_bucket.bucket.name
  source = var.source_zip_path
}
