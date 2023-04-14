# Define the VPC
resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Define the private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.aws_private_subnet_cidr_block
}

# Define the public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.aws_public_subnet_cidr_block
}

# Define the internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Define the route table for the public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

# Define the Elastic IP address
resource "aws_eip" "eip" {
  vpc = true
}

# Define the Elastic IP address
resource "aws_eip" "instance_eip" {
  vpc = true
}

# Define the NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_subnet.id
}

# Define the route table for the private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "private_route_table"
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Create a Transit Gateway
resource "aws_ec2_transit_gateway" "this" {
  description = "AWS Transit Gateway"
  transit_gateway_cidr_blocks = [var.aws_transit_gateway_cidr_block]

  tags = {
    Name = "Transit Gateway for main VPC"
  }
}

# Create a VPC attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = aws_vpc.main.id
  subnet_ids         = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id]

  # Enable DNS support and IPv6 support
  dns_support = "enable"
  ipv6_support = "disable"

  # Associate and propagate routes to the default route table
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true

  # Apply tags to the attachment
  tags = {
    Name = "main VPC Attachment"
  }
}

# create customer gateway
resource "aws_customer_gateway" "this" {
  bgp_asn    = 65001
  ip_address = "172.0.0.1"
  type       = "ipsec.1"
}

# adding vpn connection to transit gateway
resource "aws_vpn_connection" "this" {
  customer_gateway_id = aws_customer_gateway.this.id
  transit_gateway_id  = aws_ec2_transit_gateway.this.id
  type                = aws_customer_gateway.this.type
}