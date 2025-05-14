terraform {
  backend "s3" {
    bucket = "terraform-state-481939335718"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

output "demo" {
  value = "Hello, world!"
}