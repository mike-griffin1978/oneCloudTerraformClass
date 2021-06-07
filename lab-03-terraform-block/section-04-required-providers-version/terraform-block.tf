# Terraform Block
terraform {
  required_version = "= 0.15.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
}

/*
Additiinal operators of interest

      # Remember to use the "terraform init -upgrade" command if a provider pre-exist and a change to the current/running
      # version is to be either upgraded or downgraded.  An execution of only "terraform init" would fail if a version
      # upgrade/downgrade is introduced.

      # Specifies the version must be greater than or equal 3.0.0 and less than 3.1.0
      version = ">= 3.0.0, < 3.1.0"
      # Specifies the version must be greater than or equal 3.0.0 and less than or equal 3.1.0
      version = ">= 3.0.0, <= 3.1.0"         
*/
