module "function2" {
  source          = "../../"
  location        = "us-central1"
  project         = data.google_project.project.name
  source_zip_path = data.archive_file.golang.output_path
  schedule        = "0 0 1 * *" # MONTHLY
  function_name   = "btdelete"
  key_id          = "projects/pangpt/locations/us-central1/keyRings/pangpt_kms_key_ring/cryptoKeys/pangpt_kms_crypto"
  env_vars = {
    "InstanceID" = "pangpt"
    "TableID"    = "pangpt"
  }
  body = base64encode(jsonencode({ "name" : "Hello World" }))
}


data "google_project" "project" {
}
