# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "my-terraform-vpc"
#   cidr = "10.10.0.0/16"

#   azs             = []
#   private_subnets = []
#   public_subnets  = []

#   enable_nat_gateway = false
#   enable_vpn_gateway = false

# }