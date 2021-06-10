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

# This manifest calls/utilized our Custom Terraform Module
# The named assigned to the module within this manifest is arbitrary and could be any descript
# naming of our choice
module "website_s3_bucket" {
  # The defined source of our module - as this is a custom/local module - points to the directory path
  # that the module is located in
  source = "./modules/s3-bucket" # Mandatory
  # Pass in the bucket_name variable which the module is expecting for naming the bucket which in this case
  # is defined within the variables.tf file
  bucket_name = var.my_s3_bucket
  # Additonally pass in the tag values that are again set in the variables.tf file
  tags = var.my_s3_tags
}

