# main.tf

# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region     = "eu-west-2"  # Specify your desired AWS region
  access_key = var.aws_access_key  # Enter AWS IAM access key
  secret_key = var.aws_secret_key  # Enter AWS IAM secret key
}

# Create an ECR repository
resource "aws_ecr_repository" "filevault_ecr_repo" {
  name = "filevault-repo"
}