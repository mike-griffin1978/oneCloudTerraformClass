# Create S3 Bucket Resource
# The creation of the module is no different the creation of a typical Terraform resource
# In a module resource effective use of variables is needed - I.e. in this case the bucket name is
# var.bucket_name so that resources calling this module may pass in preferred name
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  # The policy section that follows allows public access to the S3 bucket on creation which is necessary
  # to allow static website hosting
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
EOF
  # The S3 bucket is configued to host a static website - which is a unique capability of AWS S3 buckets to
  # easily allow a simplistic/static web site - and is used in our example as a simply means of testing
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags          = var.tags
  force_destroy = true
}

