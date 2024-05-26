provider "aws" {
  region = "us-east-1"  # Specify the AWS region
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket1234"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_bucket.bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.bucket_arn
}
