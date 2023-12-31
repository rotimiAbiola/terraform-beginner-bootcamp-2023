module "terrahouse_aws" {
  source      = "./modules/terrahouse_aws"
  bucket_name = var.bucket_name
  content_version = var.content_version
  #   index_html_filepath = var.index_html_filepath
  #   error_html_filepath = var.error_html_filepath
}
