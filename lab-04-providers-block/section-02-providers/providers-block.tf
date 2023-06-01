# Terraform Block
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
# The provider name ("aws") within this block must match a required_providers logical name in the terraform block
provider "aws" {
  # Required region parameter specifying the AWS region resources shall be created within
  # While no resources are created within this manifest - as our focus thus far is only on the terraform and provider blocks 
  # with the resources block yet to come - the region specification is provided as it is required and will be key in 
  # subsequent labs
  region = "us-east-1"
  # The authentication type require parameter of "profile" dictates that the AWS configuration file key ID and secret access
  # key will be utilized and in this case the "default" account auth details will be used
  profile = "default"
}
