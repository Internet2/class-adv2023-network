# aws section
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_ssh_key" {
    description = "SSH key to use for the instance"
    type        = string
    sensitive   = true
}

variable "aws_instance_size" {
    description = "Instance size"
    type        = string
}

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

# azure section
variable "az_subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "az_resource_group" {
  type        = string
  description = "Azure resource group"
}

#gcp section
variable "gcp_project_id" {
  type        = string
  description = "GCP project ID"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type = string
}

variable "gcp_private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  type = string
}

variable "gcp_public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type = string
}