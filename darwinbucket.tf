provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "s3-bucket" {
  provider = aws.us-east-1
  bucket   = "digitalrw-"
  acl      = "private"
  
  versioning {
    enabled = true
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  
  lifecycle_rule {
    id = "CleanOldVersion"
    prefix  = ""
    enabled = true
    abort_incomplete_multipart_upload_days = 1
    noncurrent_version_expiration {
      days = 14
    }
  }
  
  tags = {
    ApplicationID             = "PHYLOv2"
    Environment               = var.env
    PrimaryApplicationOwner   = "0"
    CostCenter                = "0"
    ProjectID                 = "0"
    Expiration                = "0"
    MIO                       = "0"
    ManagedBy                 = "Terraform"
    APP_GEN1                  = "S3-PHYLOv2"
  }
}
