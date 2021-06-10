# Terraform Block
terraform {
  required_version = "~> 0.15.4"
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

# Call our Custom Terraform Module which we built earlier

module "website_s3_bucket" {
  source      = "./modules/s3-bucket" # Mandatory
  bucket_name = var.my_s3_bucket
  tags        = var.my_s3_tags
}
