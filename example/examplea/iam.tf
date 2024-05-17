resource "google_kms_crypto_key_iam_member" "crypto_key" {
  crypto_key_id = "projects/${data.google_project.project.project_id}/locations/us-central1/keyRings/pangpt_kms_key_ring/cryptoKeys/pangpt_kms_crypto"
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "serviceAccount:service-${data.google_project.project.number}@gcf-admin-robot.iam.gserviceaccount.com"
}
