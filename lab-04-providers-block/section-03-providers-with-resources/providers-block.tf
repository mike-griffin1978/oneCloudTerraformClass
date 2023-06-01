# Terraform Block
terraform {
  required_version = "~> 1.0"
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

####Note regarding lab usage of the Resource block#########
####Replace reference to lab Pod Number 0 with your unique, assigned pod number
####Example - vpc-pod-0 within the tags block - edit the tags Name value to include 
### your own pod number such as - "vpc-pod-<pod-number>"

# Resources Block
# Creates a VPC (Virtual Private Cloud) with associated CIDR block and AWS tag with key of "Name"
# In the resource line the type is specified as "aws_vpc" and a logical name is assigned as "vpc-pod1"
resource "aws_vpc" "vpc-pod1" {
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "vpc-pod-0"
  }
}


