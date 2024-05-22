provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "darwin_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

