data "aws_ami" "test" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  count = length(var.instances)
  ami           = data.aws_ami.test.id
  instance_type = "t3.micro"

  tags = {
    Name = element(var.instances, count.index)
  }
}

variable "instances" {
  default = ["frontend", "catalogue", "cart"]
}