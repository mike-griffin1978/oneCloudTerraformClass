####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - aws_vpc resource block - replace both the resource name (vpc-dev-1) and the tags Name
####value (vpc-dev-1) to include your own pod number such as - "vpc-dev-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Resource-8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm-0" {
  ami                    = "ami-0742b4e673072066f" # Amazon Linux
  instance_type          = "t2.micro"
  key_name               = "terraform-key-0"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-0.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg-0.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to OneCloud! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  tags = {
    "Name" = "myec2vm-0"
  }
}



