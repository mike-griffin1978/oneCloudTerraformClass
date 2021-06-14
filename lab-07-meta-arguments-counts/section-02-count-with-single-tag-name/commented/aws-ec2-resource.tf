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
  # Utilizing the Meta-Argument count argument five EC2 instances suing this template's specs will be created
  # Without the count argument - to arrive at the same end goal of five identical compute instances - we would have to
  # configure/include five separate EC2 resource blocks
  count = 5
  tags = {
    # If we desire that all instances share a common Name tag - which would allow isolation of all related instances in a 
    # single search easily - we would use this technique
    # This is the technique used in this exercise
    "Name" = "ec2-web-instance-0"
    # If we desire that all instance receive a unique Name tag - which would allow isolation of individual instances in a
    # search easily - we would use this technique
    # using the count.index method extracts the unique index (which in the case would be indexes 0-4) and includes as part of
    # the tag naming convention
    # This technique is not in use within this lab and is commented out
    #"Name" = "ec2-web-instance-${count.index}-0"
  }
}


