# Terraform Block
terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

####Note regarding lab usage of and the local values blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - bucket-0 - replace  the key value with your own pod number such
#### as (bucket-1)
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Define Local Values
# Without the use of Local Values defined below - the following logic would need to be included in both in the resouce block
# both within the bucket and tags statements.  But with the use of the local value we can simply define the complex logic
# once and then call it where ever necessary leading to much cleaner code.
locals {
  bucket-name = "${var.app_name}-${var.environment_name}-bucket-0" # Complex expression
}

# Create S3 Bucket - with Input Variables & Local Values
resource "aws_s3_bucket" "mys3bucket" {
  # The local value of "bucket-name" is used to name the bukcet
  bucket = local.bucket-name
  acl    = "private"
  tags = {
    # The local value of "bucket-name" is used to define the Name tag
    Name        = local.bucket-name
    Environment = var.environment_name
  }
}
