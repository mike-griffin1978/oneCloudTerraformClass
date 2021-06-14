# Input Variables

# In this file we introduce Terraform variables with three simple examples - AWS Region, AWS AMI (Amazon Machine Image), amd
# Count

# The varibles defined in this dedicated variables file are imported/utilized within the resources.tf file and aid in Resource
# definition

# Variables defined in this file consist of three primary parts.  We will use this first example of AWS region to break down
# those components
variable "aws_region" {
  # Simple description of the variable for your future reference and clarification to other developers encountering the file
  description = "Region in which AWS resources to be created"
  # The type of the variable.  In tis file we include examples of string and number type variables.  Bool (boolean), 
  # list (array), and map are other possible variable types.
  type = string
  # The default value of the variable which is utilized unless the default is overridden.  In this lab example the default
  # values will be utilized on resource creation.
  default = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0742b4e673072066f" # Amazon2 Linux AMI ID
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}


