terraform {
  backend "s3" {
    bucket         = "terraform-state-481939335718"  # Your S3 bucket name
    key            = "dev/network/terraform.tfstate"  # File path in bucket
    region         = "us-east-1"  # S3 and DynamoDB region
    dynamodb_table = "terraform-locks"  # This is how Terraform links it
    encrypt        = true
  }
}
