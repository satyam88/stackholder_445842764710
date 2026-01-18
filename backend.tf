terraform {
  backend "s3" {
    bucket       = "terraform-demo-backedn001"
    key          = "prod/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
