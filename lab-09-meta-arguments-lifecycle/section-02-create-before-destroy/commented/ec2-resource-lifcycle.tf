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
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  # To validate the change in replacement behavior we will originally create the EC2 resource in one availability
  # zone and then change the manifest setting and update the resouece to an alternate availability zone.  The change
  # of the AZ provokes a replacement event and thus we have the opportunity to validate that the new resource is 
  # created in the new AZ prior to the pre-existing resource being destroyed from the previous AZ
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
  tags = {
    "Name" = "web-server-0"
  }

  # The Meta-Argument Lifecycle option of "create_before_destroy" allows an alteration of the default replacement
  # sequencing to ensure that the new reource - in this example an EC2 compute instance - is created prior to the
  # pre-existing resource from being destoyed which may lessen down time during the replacement event
  lifecycle {
    create_before_destroy = true
  }
}

