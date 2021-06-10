# Outputs definition manifest

# Note that both argument and attribute output values are defined below
# An argument is in a a value that may be passed in during the resource creation process.  Example - 
# security groups - we may dictate what security group we want assigned during resource creation.
# An attribute is a value that we cannot dictate and is assigned by AWS during the resource creation
# process.  Example - public IP address - we cannot dictate the public IP address but it is assigned by AWS

#Documentation - as an augment to this example code - visit the Terrarom AWS provider > EC2 instance 
# referenced via the URL below.  In reviewing the documentation note that there are seperate links/sections for 
# arguments and attributes.  If desired - add a couple of additional attributes and/or arguments to show that any
# of these values may be displayed via outputs.


# Attribute Reference: EC2 Instance Public IP
# The named assigned is arbitrary and may be any descript naming of your choice
output "ec2_instance_publicip" {
  # The description will be displayed in the terminal - along with the value - and is an opportunity to provide further
  # detail to the user that may see such values in the terminal.
  description = "EC2 Instance Public IP"
  # The value using the convention of - <resource-type>.<name-of-the-resource(from resource.tf)>.<attribute/argument-name>
  value = aws_instance.my-ec2-vm.public_ip
}

# Argument Reference: EC2 Instance Private IP
output "ec2_instance_privateip" {
  description = "EC2 Instance Private IP"
  value       = aws_instance.my-ec2-vm.private_ip
}
# Argument Reference: Security Groups associated to EC2 Instance
output "ec2_security_groups" {
  description = "List Security Groups associated with EC2 Instance"
  value       = aws_instance.my-ec2-vm.security_groups
}

# Attribute Reference - Create Public DNS URL with http:// appended
output "ec2_publicdns" {
  description = "Public DNS URL of an EC2 Instance"
  # In this value we are constructing a URL that a user could copy/paste directly.  Thus we are prepending "http://" to
  # the value of the attribute.
  value = "http://${aws_instance.my-ec2-vm.public_dns}"
}

