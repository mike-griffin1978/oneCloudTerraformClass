####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - aws_vpc resource block - replace both the resource name (vpc-dev-1) and the tags Name
####value (vpc-dev-1) to include your own pod number such as - "vpc-dev-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Resource-9: Create Elastic IP
resource "aws_eip" "my-eip" {
  instance = aws_instance.my-ec2-vm-0.id
  vpc      = true
  # Meta-Argument
  depends_on = [aws_internet_gateway.vpc-dev-igw-0]
}
