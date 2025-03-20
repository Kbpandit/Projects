resource "aws_s3_bucket" "mys3bucket" {

  # for_each Meta-Argument
  for_each = {
    dev  = "my-dapp-bucket-kb1"
    qa   = "my-qapp-bucket-kb2"
    stag = "my-sapp-bucket-kb3"
    prod = "my-papp-bucket-kb4"
  }

  bucket = "${each.key}-${each.value}"

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}