provider "aws" {
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  

  bucket = "my-s3-bucket12"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  
  force_destroy = false
  versioning    = true
  magellan_cors = true
  
  
}