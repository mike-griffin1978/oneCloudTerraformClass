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
  region = "us-east-1"
}

####Note regarding lab usage of the Resource block#########
####Replace reference to lab Pod Number 0 with your unique, assigned pod number
####Example - ec2-resource-pod-0 within the tags block - edit the tags Name value to include 
### your own pod number such as - "ec2-resource-pod-<pod-number>"

# Reference the following Terraform registry documentation for further information on EC2 resource creation
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "my-ec2-vm" {
  # ami (amazon machine image = operating system ID) is a required field for EC2 instances
  ami = "ami-0742b4e673072066f"
  # instance type (hard specs for virtual machine) is a required field for EC2 instances
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "ec2-resource-pod-0"
  }
}


