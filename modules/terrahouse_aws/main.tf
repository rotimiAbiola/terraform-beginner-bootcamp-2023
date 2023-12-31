terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "web_config" {
  bucket = aws_s3_bucket.web_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_object" "website_files" {
  for_each = fileset("./public/", "**")
  bucket = aws_s3_bucket.web_bucket.bucket
  key    = each.value
  source = "./public/${each.value}"
  etag = filemd5("./public/${each.value}")
}

# resource "aws_s3_object" "error_file" {
#   bucket = aws_s3_bucket.web_bucket.bucket
#   key    = "404.html"
#   source = var.error_html_filepath
#   etag = filemd5(var.error_html_filepath)
# }