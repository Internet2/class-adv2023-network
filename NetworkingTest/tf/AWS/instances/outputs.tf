output "aws_instance_id" {
    value = resource.aws_instance.ec2_instance.id
}

output "aws_private_instance_ip" {
    value = resource.aws_instance.ec2_instance.private_ip
}

output "aws_instance_network_interface_id" {
    value = resource.aws_instance.ec2_instance.primary_network_interface_id
}