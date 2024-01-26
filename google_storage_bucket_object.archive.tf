resource "google_storage_bucket_object" "archive" {
  name   = basename(var.sourcezippath)
  bucket = google_storage_bucket.bucket.name
  source = var.sourcezippath
}
