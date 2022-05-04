terraform {
  required_version = "1.1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "tf-course-eduardo" {
  bucket = "tf-course-eduardo"

  tags = {
    Name        = "tf-course-eduardo"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    UpdatedAt   = "04/05/2022"
  }
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.tf-course-eduardo.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.tf-course-eduardo.id
  
  versioning_configuration {
    status = "Disabled"
  }
}