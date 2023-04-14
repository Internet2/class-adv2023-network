variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project_id" {
  type        = string
  description = "GCP project ID"
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