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
  region  = "us-east-1"
  profile = "default"
}

# Create 3 EC2 Instances via a string map

####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - replace both the resource name (ec2-instance-0) to include your own pod number such as 
# - "ec2-instance-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Create EC2 Instance
resource "aws_instance" "ec2-instance-0" {
  for_each      = toset(["web", "db", "proxy"])
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "ec2-instance-0-${each.key}"
  }
}


