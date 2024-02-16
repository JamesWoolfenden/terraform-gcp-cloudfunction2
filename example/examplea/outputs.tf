output "function" {
  value     = module.function2
  sensitive = true
}

output "member" {
  value = google_bigtable_instance_iam_member.reader
}
