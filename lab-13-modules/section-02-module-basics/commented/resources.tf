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

####Note regarding lab usage and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - terraform-key-0 - replace the key value with your own pod number such
#### as "terraform-key-1" for student pod #1
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# AWS EC2 Instance Module defintion - note that the name of the cluster is arbitrary and could be anything descript
module "ec2_cluster" {
  # Defintion of the source within the Terraform public modules registry
  # The necessary values of the source could be found with the registry's documentation - along with the required/desired attributes
  # in this code base at the following URL:
  # https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest?tab=outputs
  source = "terraform-aws-modules/ec2-instance/aws"
  # The version refers the version of the registry module.  At the time of this writing - the latest version of the ec2_instance
  # module is 2.19.0.  Based on the operator used below - any version in the 2.X range would be allowed and the latest in that
  # 2.X range version would be downloaded and utilized.
  version = "~> 2.0"

  # The Input variables that follow - ranging from name thru subnet_id - are required fields and are found in the example code base shown
  # in the ec2_instance documentation site
  # Additional Input variables may be found at the previously referenced documentation site for this module and within the Inputs tab
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

