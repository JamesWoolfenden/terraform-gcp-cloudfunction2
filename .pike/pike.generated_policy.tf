
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.delete",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.functions.setIamPolicy",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "cloudscheduler.jobs.create",
    "cloudscheduler.jobs.delete",
    "cloudscheduler.jobs.enable",
    "cloudscheduler.jobs.get",
    "cloudscheduler.jobs.update",
    "resourcemanager.projects.get",
    "run.services.getIamPolicy",
    "run.services.setIamPolicy",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.list"
  ]
}
