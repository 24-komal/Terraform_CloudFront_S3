resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl = "private"
  tags = {
    Name        = "${var.bucket_name}"
  }
}

output "bucket_info" {
  value = aws_s3_bucket.bucket
}
