# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - ec2-instance-0 within the tags block - replace the tags Name value to include 
### your own pod number such as - "ec2-instance-<pod-number>"

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0742b4e673072066f" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  tags = {
    "Name" = "ec2-instance-0"
  }
}
