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
  region  = var.aws_region
  profile = "default"
}

####Note regarding lab usage of and the Module block#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - replace both the module name (my-modules-demo-0) to include your own pod number such as 
# - "my-modules-demo-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# AWS EC2 Instance Module
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"


  name           = "my-modules-demo-0"
  instance_count = 2

  ami                    = "ami-0742b4e673072066f"
  instance_type          = "t2.micro"
  key_name               = "terraform-key-0"
  monitoring             = true
  vpc_security_group_ids = ["sg-0c8bf4279cdc35278"] # Default VPC Security Group ID allowing HTTP
  subnet_id              = "subnet-81d9abaa"        # A public subnet id from default vpc
  user_data              = file("apache-install.sh")

  tags = {
    Name        = "Modules-Demo-0"
    Terraform   = "true"
    Environment = "dev"
  }
}

