provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
}

module "bucket1" {
  source      = "git::https://github.com/satyam88/aws_tf_modules.git//modules/s3bucket?ref=v1.1.0"
  bucket_name = "satyambucketdemo8781"
}

module "bucket2" {
  source      = "git::https://github.com/satyam88/aws_tf_modules.git//modules/s3bucket?ref=v1.1.0"
  bucket_name = "satyambucketdemo8780"
}

module "bucket3" {
  source      = "git::https://github.com/satyam88/aws_tf_modules.git//modules/s3bucket?ref=v1.1.0"
  bucket_name = "satyambucketdemo87833"
}

module "my_vpc" {
  source          = "git::https://github.com/satyam88/aws_tf_modules.git//modules/vpc?ref=v1.1.2"
  vpc_name        = "satyam-vpc"
  cidr_block      = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
}
