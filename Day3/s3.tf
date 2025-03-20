provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "kb-mybucket1234"
  acl    = "private"

  tags = {
    Name        = "Mys3Bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}
