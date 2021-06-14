# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
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

# Note that this variable block has no default value (default value is present for all other variables defined in this file thus far)
# As no default variable exists - the user will be prompted to input the variable valu during terraform plan/apply activities
variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

