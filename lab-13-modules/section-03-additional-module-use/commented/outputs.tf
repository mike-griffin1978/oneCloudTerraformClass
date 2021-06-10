# Output variable definitions

output "ec2_instance_public_ip" {
  description = "Public IP Addressess of EC2 Instances"
  value       = module.ec2_cluster.*.public_ip
}

output "ec2_instance_public_dns" {
  description = "Public DNS for EC2 Instances"
  value       = module.ec2_cluster.*.public_dns
}

output "ec2_instance_private_ip" {
  description = "Private IP Addresses for EC2 Instances"
  value       = module.ec2_cluster.*.private_ip
}

# Two sections are added to the outputs.tf file from the prior section and are listed below in the addition of the
# availability_zone and security_groups output
output "ec2_instance_availability_zone" {
  description = "Availability Zone for EC2 Instances"
  # The value is in the form of - module.<module_name>.*.<exposed_output_from_module>
  # Breaking down this syntax a bit further:
  # - module is always consistent and declares this output is coming from a module and that Terraform should reference a module
  # - ec2_cluster (in this example) is the name of the specific module of interest.  In our example and within the resources.tf file
  # we named the module ec2_cluster
  # - the "*" is necessary because the values returned are a list.  In other words - the value returned in this case is not a single
  # value but rather is a list of values - I.e. a list and possibly multiple availability zones may be returned.  The fact that this
  # value is a list and thus the need of a * could be ascertained via the module's documentation and the Output tab of the registry
  # - availability_zone specifies the output - as exposed by the module - that we are interested in.  A full list of exposed outputs is
  # available in the registry's module documentation
  value = module.ec2_cluster.*.availability_zone
}

output "ec2_instance_security_groups" {
  description = "Security Groups for EC2 Instances"
  value       = module.ec2_cluster.*.security_groups
}
