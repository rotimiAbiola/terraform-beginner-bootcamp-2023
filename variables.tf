variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

  validation {
    condition     = length(var.bucket_name) > 3 && length(var.bucket_name) < 64
    error_message = "Bucket name must be between 4 and 63 characters"
  }
}
