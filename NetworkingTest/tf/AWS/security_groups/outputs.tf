output "aws_security_group_id" {
    value = resource.aws_security_group.private_sg.id
}