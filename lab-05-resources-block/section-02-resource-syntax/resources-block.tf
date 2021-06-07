# Terraform Block
terraform {
  required_version = "~> 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
}

# Reference the following Terraform registry documentation for further information on EC2 resource creation
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "my-ec2-vm" {
  # ami is a required field for EC2 instances
  ami = "ami-0742b4e673072066f"
  # instance type is a required field for EC2 instances
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "ec2-resource-pod1"
  }
}
