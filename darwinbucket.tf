provider "aws" {
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
}

