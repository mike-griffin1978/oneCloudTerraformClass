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

output "ec2_instance_availability_zone" {
  description = "Availability Zone for EC2 Instances"
  value       = module.ec2_cluster.*.availability_zone
}

output "ec2_instance_security_groups" {
  description = "Security Groups for EC2 Instances"
  value       = module.ec2_cluster.*.security_groups
}
