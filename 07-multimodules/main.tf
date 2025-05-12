module "sample1" {
  source = "./ec2"
  name = "sample1"
}

module "sample2-ec2" {
  source = "./ec2"
  name = "sample2"
}