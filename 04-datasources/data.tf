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

data "aws_ami" "amiid" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "devops-practice"
  owners           = ["self"]
}

output "ami_id" {
  value = data.aws_ami.amiid.id
  
}