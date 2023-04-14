variable "aws_vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type = string
}

variable "aws_private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  type = string
}

variable "aws_public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type = string
}

variable "aws_transit_gateway_cidr_block" {
  description = "The CIDR block for the Transit Gateway."
  type = string
}