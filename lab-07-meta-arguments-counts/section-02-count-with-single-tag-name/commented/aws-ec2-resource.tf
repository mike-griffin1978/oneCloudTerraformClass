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

####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - aws_vpc resource block - replace both the resource name (vpc-dev-1) and the tags Name
####value (vpc-dev-1) to include your own pod number such as - "vpc-dev-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Create EC2 Instance
resource "aws_instance" "ec2-web-instance-0" {
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  # Using the count argument five instances using this EC2 template will be created
  # Without the count argument - to arrive at the same end goal of five identical compute instances - we would have to
  # configure/include five separate EC2 resource blocks
  count = 5
  tags = {
    # If we desire that all instances share a common Name tag - which would allow isolation of all related instances in a 
    # single search easily - we would use this technique
    "Name" = "ec2-web-instance-0"
    # If we desire that all instance receive a unique Name tag - which would allow isolation of individual instances in a
    # search easily - we would use this technique
    # using the count.index method extracts the unique index (which in the case would be indexes 0-4) and includes as part of
    # the tag naming convention
    #"Name" = "ec2-web-instance-${count.index}-0"
  }
}


