resource "aws_security_group" "webserver_sg" {
    name = "webserver-sg"
    vpc_id = "vpc-0d924a18d7e461109"
  
    ingress {
        description = "Allow http traffic from gcp webserver"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["10.20.0.0/16"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "webserver-sg"
    }
}