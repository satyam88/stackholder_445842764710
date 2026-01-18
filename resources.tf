module "bucket1" {
  source      = "git::https://github.com/satyam88/aws_tf_modules.git//modules/s3bucket?ref=v1.1.0"
  bucket_name = "satyambucketdemo8781"
}

module "bucket2" {
  source      = "git::https://github.com/satyam88/aws_tf_modules.git//modules/s3bucket?ref=v1.1.0"
  bucket_name = "satyambucketdemo8780"
}

module "myec201" {
  source        = "git::https://github.com/satyam88/aws_tf_modules.git//modules/ec2?ref=v1.1.0"
  instance_type = "t3.micro"
}

module "my_vpc" {
  source          = "git::https://github.com/satyam88/aws_tf_modules.git//modules/vpc?ref=v1.1.2"
  vpc_name        = "satyam-vpc"
  cidr_block      = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
}

module "mysql_db" {
  source                 = "git::https://github.com/satyam88/aws_tf_modules.git//modules/mysqldb?ref=v1.1.2"
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  instance_class         = var.instance_class
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_ids = [
    module.my_vpc.private_subnets_ids[0],
    module.my_vpc.private_subnets_ids[1]
  ]
}