module "function2" {
  source          = "../../"
  location        = "us-central1"
  project         = data.google_project.project.name
  source_zip_path = data.archive_file.golang.output_path
  schedule        = "0 0 1 * *" # MONTHLY
  function_name   = "btdelete"
}


data "google_project" "project" {
}
