variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

  validation {
    condition     = length(var.bucket_name) > 3 && length(var.bucket_name) < 64
    error_message = "Bucket name must be between 4 and 63 characters"
  }
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string

#   validation {
#     condition     = fileexists(var.index_html_filepath)
#     error_message = "The provided path for index.html does not exist"
#   }
}

variable "error_html_filepath" {
  description = "The file path for 404.html"
  type        = string

#   validation {
#     condition     = fileexists(var.error_html_filepath)
#     error_message = "The provided path for 404.html does not exist"
#   }
}
