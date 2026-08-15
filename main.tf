provider "aws" {
  region = "us-east-1"
}

# 1. S3 Bucket बनाना
resource "aws_s3_bucket" "website_bucket" {
  bucket = "krishna-cloud-portfolio-bucket" # इसे यूनिक नाम दें
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.website_bucket.id
  index_document { suffix = "index.html" }
  error_document { key    = "error.html" }
}

# 2. CloudFront Distribution (Global Content Delivery)
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.website_bucket.bucket_regional_domain_name
    origin_id   = "S3-.krishna-portfolio"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-.krishna-portfolio"

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction { restriction_type = "none" }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
