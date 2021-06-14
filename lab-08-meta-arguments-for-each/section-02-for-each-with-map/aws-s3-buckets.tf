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

resource "aws_s3_bucket" "mys3bucket-0" {

  # for_each Meta-Argument
  for_each = {
    dev  = "my-dapp-bucket-0"
    qa   = "my-qapp-bucket-0"
    stag = "my-sapp-bucket-0"
    prod = "my-papp-bucket-0"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}
