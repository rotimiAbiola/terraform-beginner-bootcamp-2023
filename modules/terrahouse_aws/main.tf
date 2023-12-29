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
