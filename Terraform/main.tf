terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
 
provider "aws" {
  region = var.aws_region
}
 
variable "aws_region" {
  type    = string
  default = "us-east-1"
}
 
variable "bucket_name" {
  type    = string
  default = "my-unique-idc-gh-actions-bucket"
}
 
resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  force_destroy = true # Allows deleting the bucket even if it contains objects during testing
}
 
# Block all public access for security best practices
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.my_bucket.id
 
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}