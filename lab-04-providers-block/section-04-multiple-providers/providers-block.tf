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

# Provider-1 for us-east-1
# With no alias command specified - this becomes the Default Provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Provider-2 for us-east-2
# The alias command introduced allows the calling of this provider via a Meta-Argument as seen in the
# resource block
provider "aws" {
  region  = "us-east-2"
  profile = "default"
  alias   = "aws-east-2"
}


# Resource Block to Create VPC in us-east-1 which uses default provider
resource "aws_vpc" "vpc-us-east-1-pod1" {
  cidr_block = "10.1.1.0/24"
  tags = {
    "Name" = "vpc-us-east-1-pod1"
  }
}

# Resource Block to Create VPC in us-east-2
# provider = <PROVIDER NAME>.<ALIAS>  
# This is referred to as Meta-Argument.  We will explore Meta-Arguments further in the Resources labs.
resource "aws_vpc" "vpc-us-east-2-pod1" {
  cidr_block = "10.1.2.0/24"
  provider   = aws.aws-east-2
  tags = {
    "Name" = "vpc-us-east-2-pod1"
  }
}
