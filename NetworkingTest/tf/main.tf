module "AWS" {
  source                         = "./AWS"
  aws_ssh_key                    = var.aws_ssh_key
  aws_instance_size              = var.aws_instance_size
  aws_vpc_cidr_block             = var.aws_vpc_cidr_block
  aws_private_subnet_cidr_block  = var.aws_private_subnet_cidr_block
  aws_public_subnet_cidr_block   = var.aws_public_subnet_cidr_block
  aws_transit_gateway_cidr_block = var.aws_transit_gateway_cidr_block
}

# module "Azure" {
#     source = "./Azure"
#     az_resource_group = var.az_resource_group
#     az_subscription_id = var.az_subscription_id
# }

# module "GCP" {
#   source                        = "./GCP"
#   gcp_project_id                = var.gcp_project_id
#   gcp_region                    = var.gcp_region
#   gcp_vpc_cidr_block            = var.gcp_vpc_cidr_block
#   gcp_private_subnet_cidr_block = var.gcp_private_subnet_cidr_block
#   gcp_public_subnet_cidr_block  = var.gcp_public_subnet_cidr_block
# }