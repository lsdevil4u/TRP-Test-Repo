provider "aws" {
  region = "eu-west-1"  # Specify the AWS region if needed
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket = "digitalrnd-gxp-genstab-prod-virginia-trp-27may2024"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  logging = {
    target_bucket = "my-s3-bucket1111"  # Replace with your logging target bucket
    target_prefix = ""  # Use an empty string to log to the root of the bucket
  }

  lifecycle_rule = [
    {
      id                                     = "rule1"
      enabled                                = true
      abort_incomplete_multipart_upload_days = 1
      expiration = {
        days = 365  # Expire after one year
      }
      noncurrent_version_expiration = {
        days = 56
      }
      transition = {
        days          = 30
        storage_class = "GLACIER"
      }
      noncurrent_version_transition = {
        days          = 30
        storage_class = "GLACIER"
      }
    }
  ]
}
