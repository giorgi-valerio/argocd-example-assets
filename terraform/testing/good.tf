resource "aws_s3_bucket" "my-kfc-bucket" {

  bucket              = "kluck-kluck-bucket"
  block_public_acls   = true
  block_public_policy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"

      }
    }
  }

  tags = {
    Name       = "kluck-kluck-bucket"
    CostCenter = "Poultry"
    Owner      = "Testing Team"
  }
}

resource "aws_s3_bucket_public_access_block" "my-kfc-bucket-policy" {
  bucket = aws_s3_bucket.my-kfc-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
