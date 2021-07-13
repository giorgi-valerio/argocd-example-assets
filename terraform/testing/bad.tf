resource "aws_s3_bucket" "my-kfc-bucket" {

  bucket = "kluck-kluck-bucket"
  acl    = "public-read"

  tags = {
    Name       = "kluck-kluck-bucket"
    CostCenter = "Poultry"
    Owner      = "Tester"
  }
}
