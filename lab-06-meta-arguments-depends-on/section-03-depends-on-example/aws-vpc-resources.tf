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

# Provider Block (nothing to replace in this block for lab usage)
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


# Resource-1: Create VPC
resource "aws_vpc" "vpc-dev-0" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-dev-0"
  }
}

# Resource-2: Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet-0" {
  vpc_id                  = aws_vpc.vpc-dev-0.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# Resource-3: Internet Gateway 
resource "aws_internet_gateway" "vpc-dev-igw-0" {
  vpc_id = aws_vpc.vpc-dev-0.id
}

# Resource-4: Create Route Table
resource "aws_route_table" "vpc-dev-public-route-table-0" {
  vpc_id = aws_vpc.vpc-dev-0.id
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-dev-public-route-0" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table-0.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw-0.id
}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate-0" {
  route_table_id = aws_route_table.vpc-dev-public-route-table-0.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-0.id
}

# Resource-7: Create Security Group
resource "aws_security_group" "dev-vpc-sg-0" {
  name        = "dev-vpc-default-sg-0"
  description = "Dev VPC Default Security Group"
  vpc_id      = aws_vpc.vpc-dev-0.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

