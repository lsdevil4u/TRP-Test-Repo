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

lifecycle_rule {
          + abort_incomplete_multipart_upload_days = 1
          + enabled                                = true
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)
          + expiration {
              + date                         = (known after apply)
              + days                         = 1
              + expired_object_delete_marker = (known after apply)
            }
          + noncurrent_version_expiration {
              + days = 56
            }
          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

}