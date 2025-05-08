data "aws_ec2_spot_price" "spotprice" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a" 

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "spprice" {
  value = data.aws_ec2_spot_price.spotprice.spot_price
}
data "aws_security_group" "selected" {
  name = "allow-all"
}

output "securitygroup" {
  value = data.aws_security_group.selected.id
}

data "aws_ami" "test" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["self"]
}

output "testami" {
  value = data.aws_ami.test.id
  
}