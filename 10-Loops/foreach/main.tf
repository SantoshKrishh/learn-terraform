data "aws_ami" "test" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  for_each = var.instances
    # Using for_each instead of count
  ami           = data.aws_ami.test.id
  instance_type = lookup(each.value, "instance_type", "t3.micro")

  tags = {
    Name = each.key
  }
}

variable "instances" {

    default = {
        frontend = {
            Name = "frontend"
            instance_type = "t3.micro"
        },
        catalogue = {
            Name = "catalogue"
            instance_type = "t3.micro"
        },
        cart = {
            Name = "cart"
            instance_type = "t3.micro"
        }
    }
}
