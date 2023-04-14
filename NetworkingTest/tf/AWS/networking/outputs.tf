output "aws_private_subnet_id" {
    value = resource.aws_subnet.private_subnet.id
}

output "aws_public_subnet_id" {
    value = resource.aws_subnet.public_subnet.id
}

output "aws_vpc_id" {
    value = resource.aws_vpc.main.id
}

output "aws_public_subnet_cidr_block" {
    value = resource.aws_subnet.public_subnet.cidr_block
}

output "aws_private_subnet_cidr_block" {
    value = resource.aws_subnet.private_subnet.cidr_block
}

output "aws_transit_gateway_id" {
    value = resource.aws_ec2_transit_gateway.this.id
}

output "aws_private_route_table_id" {
    value = resource.aws_route_table.private_route_table.id
}

output "aws_public_route_table_id" {
    value = resource.aws_route_table.public_route_table.id
}

output "aws_instance_eip_id" {
    value = resource.aws_eip.instance_eip.id
}