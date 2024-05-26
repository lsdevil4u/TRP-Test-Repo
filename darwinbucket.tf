provider "aws" {
  region = "us-east-1"  # Specify the AWS region if needed
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
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = module.s3_bucket.bucket_id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}