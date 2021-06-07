# Terraform Block
terraform {
  required_version = "~> 0.15.4" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
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
# - "web-server-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "web-server-0"
  }
  lifecycle {
    prevent_destroy = true # Default is false
  }
}

    
