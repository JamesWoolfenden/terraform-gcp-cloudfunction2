module "function2" {
  source        = "../../"
  location      = "us-central1"
  project       = "pike-gcp"
  sourcezippath = data.archive_file.golang.output_path
}
