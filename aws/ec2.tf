module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "terraform-testinstance"

  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.micro"
  key_name               = "awskp-kasy1"
  monitoring             = true
  vpc_security_group_ids = ["${resource.aws_security_group.webserver_sg.id}"]
  subnet_id              = "subnet-0c69a7baf3efeb85f"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

    user_data = <<EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt install nginx
      sudo ufw allow 'Nginx HTTP'
    EOF
}