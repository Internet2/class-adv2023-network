module "networking" {
  source                         = "./networking"
  aws_vpc_cidr_block             = var.aws_vpc_cidr_block
  aws_private_subnet_cidr_block  = var.aws_private_subnet_cidr_block
  aws_public_subnet_cidr_block   = var.aws_public_subnet_cidr_block
  aws_transit_gateway_cidr_block = var.aws_transit_gateway_cidr_block
}

module "security_groups" {
  source                       = "./security_groups"
  aws_vpc_id                   = module.networking.aws_vpc_id
  aws_public_subnet_cidr_block = module.networking.aws_public_subnet_cidr_block
}

module "instances" {
  source                        = "./instances"
  aws_ssh_key                   = var.aws_ssh_key
  aws_instance_size             = var.aws_instance_size
  aws_subnet_id                 = module.networking.aws_public_subnet_id
  aws_default_security_group_id = module.security_groups.aws_security_group_id
}
