####Note regarding lab usage of and the Resource blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - aws_vpc resource block - replace both the resource name (vpc-dev-1) and the tags Name
####value (vpc-dev-1) to include your own pod number such as - "vpc-dev-<pod-number>"
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Resource-8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm-0" {
  ami           = "ami-0742b4e673072066f" # Amazon Linux
  instance_type = "t2.micro"
  #Utiling the Key Pair created in Lab-06 prior and within the AWS console.  This is a per pod Key Pair.
  key_name = "terraform-key-0"
  # References the subnet created in the aws-vpc-resources manifest
  subnet_id = aws_subnet.vpc-dev-public-subnet-0.id
  # References the security group created in the aws-vpc-resources manifest
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg-0.id]

  # user_data block installs a simple Apache webserver with associated/necessary commands including: operating
  # system update, install of Apache, enabling/starting/persisting the Apache service, and echoing text into the
  # index.html file which will be displayed to user upon web site visit
  # The script content must be included between the <<-EOF and EOF keywords
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to OneCloud ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  tags = {
    "Name" = "myec2vm-0"
  }
}





