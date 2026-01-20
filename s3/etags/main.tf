terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#Create S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "aws-examples-etag-bucket-mk"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.example.id 
  key    = "testfile.txt"
  source = "testfile.txt"

  etag = filemd5("testfile.txt")
}