provider "aws" {
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "Mybucket"
    Environment = "Dev"
  }
}