data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a" 

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "example" {
  value = data.aws_ec2_spot_price.example.spot_price
}

data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "devops-practice"
  owners           = ["self"]
}