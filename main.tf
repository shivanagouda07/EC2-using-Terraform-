resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type

    tags =   {
        Name = "ec2_instance"
        Environment = "dev"
        owner = "shivu"
    }
    user_data = <<-EOF
            #!/bin/bash
            apt update -y
            apt install nginx -y
            systemctl start nginx
            systemctl enable nginx
            EOF
}

resource "aws_security_group" "ec2_eg" {
    name = "ec2_sg"

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.215.237.189/32"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

}
resource "aws_key_pair" "dev_key" {
  key_name   = "dev-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
