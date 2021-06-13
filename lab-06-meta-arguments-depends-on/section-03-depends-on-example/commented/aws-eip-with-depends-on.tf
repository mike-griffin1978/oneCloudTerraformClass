####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - resource name of my-eip-0 - replace with our own pod number such as the following for 
####pod #1 - my-eip-1
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Resource-9: Create Elastic IP
# Create an Elastic IP address resource type with the name of "my-eip-0"
resource "aws_eip" "my-eip-0" {
  # Associate the EIP created with the referenced EC2 compute instance
  instance = aws_instance.my-ec2-vm-0.id
  # Attribute is a boolean true/false value indicating if the EIP exists within a VPC.  As this is for an association with
  # an EC2 instance - and EC2 resources exists within a VPC - this value should be set to true in this circumstance.
  vpc = true
  # Meta-Argument
  # The depends_on argument states - do not attempt to create this resource (EIP) until the referenced resource (IGW in
  # in this case) has been fully created
  depends_on = [aws_internet_gateway.vpc-dev-igw-0]
}


