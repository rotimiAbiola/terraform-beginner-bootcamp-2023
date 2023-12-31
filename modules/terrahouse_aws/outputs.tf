output "bucket_name" {
    value = aws_s3_bucket.web_bucket.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.web_config.website_endpoint
}