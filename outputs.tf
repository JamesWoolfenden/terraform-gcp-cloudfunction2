output "function" {
  value = google_cloudfunctions2_function.function
}

output "bucket" {
  value = google_storage_bucket.bucket
}

output "files" {
  value = google_storage_bucket_object.archive
}

output "job" {
  value = google_cloud_scheduler_job.invoke_cloud_function
}

output "auth" {
  value = google_cloudfunctions2_function_iam_member.invoker
}

output "account" {
  value = google_service_account.account
}
