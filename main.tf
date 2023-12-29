resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
  }
}
