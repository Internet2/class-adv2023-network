module "networking" {
    source                         = "./networking"
    gcp_project_id                 = var.gcp_project_id
    gcp_region                     = var.gcp_region
    gcp_vpc_cidr_block             = var.gcp_vpc_cidr_block
    gcp_private_subnet_cidr_block  = var.gcp_private_subnet_cidr_block
    gcp_public_subnet_cidr_block   = var.gcp_public_subnet_cidr_block
}