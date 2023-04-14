# Define the security group for instances in the private subnet
resource "aws_security_group" "private_sg" {
  name_prefix = "tf_private_sg_"
  vpc_id = var.aws_vpc_id

  # Allow all inbound traffic from instances in the same security group
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    self = true
  }

  # Allow inbound traffic on port 80 from the public subnet
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.aws_public_subnet_cidr_block]
  }

  # Allow inbound traffic on port 443 from the public subnet
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.aws_public_subnet_cidr_block]
  }

  # allow inbound traffic on port 22 from anywhere
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow pings from anywhere
  ingress {
    from_port = 8
    to_port   = 0
    protocol  = "icmp"
  }

  # send pings to anywhere
  egress {
    from_port = 8
    to_port   = 0
    protocol  = "icmp"
  }

  # Allow outbound traffic to the internet via the NAT Gateway
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    
  }
    
  # Add a tag to the security group
  tags = {
    Name = "private_sg"
  }
}