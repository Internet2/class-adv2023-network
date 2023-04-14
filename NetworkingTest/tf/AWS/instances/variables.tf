variable "aws_ssh_key" {
    description = "SSH key to use for the instance"
    type        = string
    sensitive   = true
}

variable "aws_subnet_id" {
    description = "Subnet ID"
    type        = string
}

variable "aws_default_security_group_id" {
    description = "Default Security group ID"
    type        = string
}

variable "aws_instance_size" {
    description = "Instance size"
    type        = string
}
