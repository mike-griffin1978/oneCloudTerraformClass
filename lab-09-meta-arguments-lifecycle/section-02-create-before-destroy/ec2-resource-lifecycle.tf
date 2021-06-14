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
####Example - replace the resource name (web-server-0) to include your own pod number such as 
##### - "web-server-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Create EC2 Instance
resource "aws_instance" "web-server-0" {
  ami               = "ami-0742b4e673072066f" # Amazon Linux
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  # availability_zone = "us-east-1b"
  tags = {
    "Name" = "web-server-0"
  }

  lifecycle {
    create_before_destroy = true
  }
}

