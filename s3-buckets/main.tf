terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "rajkumar-terraform-bucket1-2026"
   tags = {
    Name        = "Rajkumar-terraform-bucket1-2026"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "rajkumar-terraform-bucket2-2026"
   tags = {
    Name        = "Rajkumar-terraform-bucket2-2026"
    Environment = "dev"
  }
  
}

resource "aws_s3_bucket_versioning" "bucket1_versioning" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_versioning" "bucket2_versioning" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.bucket_names)
  bucket   = each.key
}
