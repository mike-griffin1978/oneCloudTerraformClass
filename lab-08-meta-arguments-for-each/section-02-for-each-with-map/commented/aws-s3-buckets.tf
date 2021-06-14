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
  region  = "us-east-1"
  profile = "default"
}

####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - mys3bucket-0 - replace with your own lab pod number - such as the following example for
####student pod #1 - mys3bucket-1
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Resource type of S3 bucket and assigned name of mys3bucket-<pod-number>
resource "aws_s3_bucket" "mys3bucket-0" {

  # for_each Meta-Argument declared with keys to distinguish separate devlopment, quality-assurance, staging,
  # and production environments that will each receive it's own S3 bucket via subsequent logic
  for_each = {
    dev  = "my-dapp-bucket-0"
    qa   = "my-qapp-bucket-0"
    stag = "my-sapp-bucket-0"
    prod = "my-papp-bucket-0"
  }

  # Declaration of the S3 bucket name.  Using the for_each map keys and values the first bucket name would
  # become - "dev-my-dapp-bucket-0".  Bucket creation will continue to eventually create four unique buckets
  # using the dervived bucket naming convention of key-value on each iterration.
  bucket = "${each.key}-${each.value}"
  # The S3 bucket ACL is set to private - indicating only explictly authorized users/sources may access the bucket.
  acl = "private"

  tags = {
    # The Environment tag will utilize the map key as the for each loop is iterrated over - I.e. dev will be the 
    # value on the first iterration
    Environment = each.key
    # The bucketname tag will utilize the map key-value as the for each loop is iterrated over 
    # - I.e. dev-my-dapp-bucket-0 will be the value on the first iterration
    bucketname = "${each.key}-${each.value}"
    # The eachvalue tag will utilize the map value as the for each loop is iterrated over - 
    # I.e. my-dapp-bucket-0 will be the value on the first iterration.  This tag does not really serve a practical
    # purpose but rather we are simply logging the value to a tag for validation of it's value in the AWS console.
    eachvalue = each.value
  }
}
