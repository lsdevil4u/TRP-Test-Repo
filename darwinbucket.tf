provider "aws" {
}

resource "aws_s3_bucket" "example" {
  tags = {
    Name        = "Mybucket"
  }
}