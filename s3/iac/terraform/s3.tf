#Create S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "aws-examples-tf-bucket-mk"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}