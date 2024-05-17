output "function" {
  value = google_cloudfunctions2_function.function
}

output "bucket" {
  value = var.bucketname
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
  value = var.serviceaccount_email
}
