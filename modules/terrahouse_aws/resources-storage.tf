resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "Production"
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

# resource "aws_s3_bucket_acl" "bucket_acl" {
#   bucket = aws_s3_bucket.web_bucket.bucket
#   acl    = "private"
# }

resource "aws_s3_object" "website_files" {
  for_each     = fileset("./public/", "**")
  bucket       = aws_s3_bucket.web_bucket.bucket
  content_type = "text/html"
  key          = each.value
  source       = "./public/${each.value}"
  etag         = filemd5("./public/${each.value}")
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly",
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::${aws_s3_bucket.web_bucket.id}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = data.aws_caller_identity.current.arn
          }
        }
      }
    ]
  })
}
