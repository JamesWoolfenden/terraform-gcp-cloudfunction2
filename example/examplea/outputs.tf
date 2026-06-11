output "function" {
  value       = module.function2
  sensitive   = true
  description = "The Cloud Function resource created by the module."
}


output "code_bucket" {
  value       = google_storage_bucket.code
  description = "The Google Storage Bucket used for Cloud Function source code."
}

output "iam" {
  value       = google_kms_crypto_key_iam_member.crypto_key
  description = "The IAM member for the KMS crypto key."
}
