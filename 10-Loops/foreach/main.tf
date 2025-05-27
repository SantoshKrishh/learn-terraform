data "aws_ami" "test" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  for_each = var.instances
    # Using for_each instead of count
  ami           = data.aws_ami.test.id
  instance_type = lookup(each.value, "instance_type", "t3.small")

  tags = {
    Name = each.key
  }
}

variable "instances" {

    default = {
        frontend = {
            Name = "frontend"
        },
        catalogue = {
            Name = "catalogue"
            instance_type = "t3.nano"
        },
        cart = {
            Name = "cart"
            instance_type = "t3.nano"
        }
    }
}
