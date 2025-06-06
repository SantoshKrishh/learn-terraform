data "aws_ami" "test" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.test.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  availability_zone = "us-east-1a"
  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow TLS inbound traffic"


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22        
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.name
  }
}

variable "name" {  
}