provider "aws" {
  region = "us-east-1"  # Specify the AWS region if needed
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.6.0"  # Specify the version of the module

  bucket = "digitalrnd-gxp-genstab-prod-virginia-trp-27may2024"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  logging = {
    target_bucket = "my-s3-bucket1111"  # Replace with your logging target bucket
    # target_prefix = ""  # Omitting this line will save logs directly in the target bucket
  }
}

# Ensure the target logging bucket exists
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "my-s3-bucket1111"
  acl    = "log-delivery-write"

  # Optionally, enable versioning for the logs bucket as well
  versioning {
    enabled = true
  }
}