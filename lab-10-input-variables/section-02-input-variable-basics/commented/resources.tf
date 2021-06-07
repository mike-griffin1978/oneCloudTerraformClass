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
  # The aws_region variable - from the variables.tf file - is called and is used to define the region value
  region  = var.aws_region
  profile = "default"
}

####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - terraform-key-0 - replace both the key value with your own pod number such
#### as (terraform-key-1)
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  # The ec2_ami_id variable - from the variables.tf file - is called and is used to define the ami value
  # Note that we do not have to import the variables.tf file or reference that file's name.  The variables in that file
  # are exported and are available globally in other Terraform file within the same directory.
  ami           = var.ec2_ami_id
  instance_type = "t3.micro"
  key_name      = "terraform-key-0"
  # The ec2_instance_count variable - from the variables.tf file - is called and is used to define the count value and thus
  # control the number of EC2 instances which will be built
  count                  = var.ec2_instance_count
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to OneCloud! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  vpc_security_group_ids = [aws_security_group.vpc-ssh-0.id, aws_security_group.vpc-web-0.id]
  tags = {
    "Name" = "myec2vm-0"
  }
}

# Create Security Group - SSH Traffic
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev VPC SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev VPC Web"

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


