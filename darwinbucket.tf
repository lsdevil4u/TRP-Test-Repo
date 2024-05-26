provider "aws" {
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws",
  source = "git@github.com:lsdevil4u/TRP-test-repo-module.git"

  bucket = "my-s3-bucket1112"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}