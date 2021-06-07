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
# Creates an AWS VPC (virtual private cloud instance)
resource "aws_vpc" "vpc-dev-0" {
  # The VPC's cidr_block - which is the IP address space for the VPC - is the only required attribute
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-dev-1"
  }
}

# Resource-2: Create Subnets
# Creates an AWS subnet IP address block which is a VPC specific/related construct
resource "aws_subnet" "vpc-dev-public-subnet-0" {
  # Note the association to a specific VPC via the VPC ID pointer
  # The reference is such as - <terraform_resource_type>.<resource_name>.<vpc_id_extracted_from_AWS>
  vpc_id = aws_vpc.vpc-dev-0.id
  # cidr_block (IP address range) and AWS availability_zone are required attributes of this Resource type
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# Resource-3: Internet Gateway 
# Creates an AWS Internet Gateway which provides a path for EC2/other instances to route traffic externally
resource "aws_internet_gateway" "vpc-dev-igw-0" {
  # As this is a per VPC related construct - the VPC ID is a required attribute
  vpc_id = aws_vpc.vpc-dev-0.id
}

# Resource-4: Create Route Table
# Creates an AWS route table which may be populated with routing info for intra/inter VPC paths and for
# paths external to the VPC (I.e. a default route to the internet)
resource "aws_route_table" "vpc-dev-public-route-table-0" {
  # As this is a per VPC related construct - the VPC ID is a required attribute
  vpc_id = aws_vpc.vpc-dev-0.id
}

# Resource-5: Create Route in Route Table for Internet Access
# Creates a route within a specified AWS route table
# In this instance we are creating a default route that has a gateway ID/destination of the internet GW
resource "aws_route" "vpc-dev-public-route-0" {
  # The route table that this route entry should be placed into, the IP address space it is relevant to 
  # (destination_cidr_block), and the destination (gateway_id) are required attributes
  # The reference ID is such as - <terraform_resource_type>.<resource_name>.<route_table_id_extracted_from_AWS>
  route_table_id         = aws_route_table.vpc-dev-public-route-table-0.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw-0.id
}

# Resource-6: Associate the Route Table with the Subnet
# Creates an association of the Route Table to a specific subnet as route tables are per subnet level constructs
resource "aws_route_table_association" "vpc-dev-public-route-table-associate-0" {
  # The associated route table to be associated and the subnet the table should be associated with are required
  # attributes
  route_table_id = aws_route_table.vpc-dev-public-route-table-0.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-0.id
}

# Resource-7: Create Security Group
# Creates an AWS Security Group that allows SSH and HTTP inbound from any source address
# These Security Group entries are necessary to allow testing of traffic to EC2 instances that will be created
# and that will exist in our created VPC
# The egress entry allows all outbound trafffic from the to be created EC2 instances
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

