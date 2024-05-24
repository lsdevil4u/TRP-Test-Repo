provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-trp-test-bucket"  # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
