#Creating local variables
locals {
    s3_origin_id = "${var.var1}${aws_s3_bucket.bucket.bucket}"
    #image_url = "${aws_cloudfront_distribution.s3_distribution.domain_name}/${aws_s3_bucket_object.image-upload.key}"
}

#Creating Cloudfront distribution which will contain our bucket domain name and provide us a url for that particular bucket.
#And so we can get our website without any delay and latency.
resource "aws_cloudfront_distribution" "s3_distribution" {
    depends_on = [
      aws_s3_bucket.bucket
    ]
    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = local.s3_origin_id
        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }
        viewer_protocol_policy = "allow-all"
    }
        enabled  = true
    origin {
            domain_name = aws_s3_bucket.bucket.bucket_domain_name
            origin_id   = local.s3_origin_id
        }
    restrictions {
            geo_restriction {
            restriction_type = "none"
            }
        }
    viewer_certificate {
            cloudfront_default_certificate = true
        }
}





