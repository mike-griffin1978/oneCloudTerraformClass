# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

####Note regarding lab usage of and the following variable blocks#########
####Replace references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - one-cloud-bucket-0 - value with your own pod number such
#### as (one-cloud-bucket-0)
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

## Create Variable for S3 Bucket Name
variable "my_s3_bucket" {
  description = "S3 Bucket name that we pass to S3 Custom Module"
  type        = string
  default     = "one-cloud-bucket-0"
}

## Create Variable for S3 Bucket Tags
variable "my_s3_tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    newtag1     = "tag1"
    newtag2     = "tag2"
  }
}
