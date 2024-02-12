data "archive_file" "golang" {
  type             = "zip"
  source_dir       = "./code"
  output_file_mode = "0666"
  output_path      = "${path.module}/go.zip"
}
