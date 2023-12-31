output "bucket_name" {
    value = aws_s3_bucket.web_bucket.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.web_config.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}