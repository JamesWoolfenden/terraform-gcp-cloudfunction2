output "function" {
  value       = google_cloudfunctions2_function.core
  description = "The Cloud Function resource created by the module."
}

output "bucket" {
  value       = var.bucketname
  description = "The name of the Google Storage Bucket used for Cloud Function source code."
}

output "files" {
  value       = google_storage_bucket_object.archive
  description = "The archive file uploaded to the Google Storage Bucket."
}

output "job" {
  value       = google_cloud_scheduler_job.invoke_cloud_function
  description = "The Cloud Scheduler job that triggers the Cloud Function."
}

output "auth" {
  value       = google_cloudfunctions2_function_iam_member.invoker
  description = "The IAM member that allows the Cloud Scheduler to invoke the Cloud Function."
}

output "account" {
  value       = var.serviceaccount_email
  description = "The email of the service account the Cloud Function runs as."
}

output "invoker_account" {
  value       = var.invoker_serviceaccount_email
  description = "The email of the service account authorized to invoke the Cloud Function."
}
