provider "aws" {
  region  = "eu-central-1"
  profile = "sharanya"
}

terraform {
  backend "s3" {
    bucket = "harald-git-codebuild-terraform123"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    profile = "sharanya"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"
  name = "codebuild-vpc"
  azs = ["eu-central-1a"]
  cidr = "10.0.0.0/16"
  private_subnets = ["10.0.69.0/24"]
  public_subnets = ["10.0.70.0/24"]

  private_subnet_tags = {
    "Name" = "codebuild_private"   
  }
  public_subnet_tags = {
    "Name" = "codebuild_public"
  }
  tags = {
    "Owner" = "Harald"
  }
}