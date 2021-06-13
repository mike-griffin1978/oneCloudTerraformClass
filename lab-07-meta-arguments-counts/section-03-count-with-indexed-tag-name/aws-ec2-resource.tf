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
####Example - ec2-web-instance-0 - replace with your own lab pod number such as the following
####example for pod #1 - ec2-web-instance-1
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1 (I.e.)

# Create EC2 Instance
resource "aws_instance" "ec2-web-instance-0" {
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  count         = 5
  tags = {
    # "Name" = "ec2-web-instance-0"
    "Name" = "ec2-web-instance-0-${count.index}"
  }
}



