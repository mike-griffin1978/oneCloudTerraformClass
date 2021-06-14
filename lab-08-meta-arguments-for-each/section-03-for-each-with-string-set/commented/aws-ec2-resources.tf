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
####Replace all references to lab Pod Number 0 with your unqiue assigned pod number.  Example - for student
####assigned pod #1 - replace ec2-instance-0 with ec2-instance-1
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Create 3 EC2 Instances via a string map
resource "aws_instance" "ec2-instance-0" {
  # Declaration of a for_each loop
  # In this loop instance a string set is utilized.  A string set is simply an array of strings.  In this 
  # circumstance we are using a set of descriptive names that we can assign to EC2 compute instances.
  # With three items in the set - three EC2 resources will be created.
  for_each      = toset(["web", "db", "proxy"])
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    # The EC2 instance Name tags will be derived from a static ec2-instance-<pod-number> string and the postpend
    # of the key extracted from the for_each loop current iteration (I.e. "web" during the first loop)
    "Name" = "ec2-instance-0-${each.key}"
  }
}


