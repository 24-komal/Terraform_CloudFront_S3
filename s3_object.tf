#Putting the single image as an object in the bucket
resource "aws_s3_bucket_object" "image_upload" {
  bucket = "${var.bucket_name}"
  key    = "${var.image_name}"
  source = "${var.image_name}"
  acl = "public-read-write"
}
