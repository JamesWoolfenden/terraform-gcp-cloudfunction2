resource "google_kms_crypto_key" "pike" {
  key_ring                   = google_kms_key_ring.pike.id
  name                       = "pike"
  rotation_period            = "7776000s"
  destroy_scheduled_duration = "604800s"

  lifecycle {
    prevent_destroy = true
  }
}
