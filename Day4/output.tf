output "s3_bucket_ids" {
  value = { for key, bucket in aws_s3_bucket.mys3bucket : key => bucket.id }
}
