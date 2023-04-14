resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami_ids.ubuntu.ids[0]
    instance_type = var.aws_instance_size
    key_name = var.aws_ssh_key
    security_groups = [var.aws_default_security_group_id]
    subnet_id = var.aws_subnet_id
    tags = {
        Name = "ec2_instance"
    }
}
