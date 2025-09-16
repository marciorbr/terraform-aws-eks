locals {
  region       = "us-east-1"
  environment  = "dev"
  project_name = "myproject"
  additional_aws_tags = {
    Owner      = "DevOpsTeam"
    Expires    = "Never"
    Department = "Engineering"
    ManagedBy  = "Terraform"
  }

  # VPC Configuration
  cidr_block           = "10.200.0.0/18"
  vpc_additional_cidrs = ["100.64.0.0/16"]

  public_subnets = [
    {
      name              = "public-1a"
      cidr              = "10.200.48.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "public-1b"
      cidr              = "10.200.49.0/24"
      availability_zone = "us-east-1b"
    }
  ]

  private_subnets = [
    {
      name              = "private-1a"
      cidr              = "10.200.0.0/20"
      availability_zone = "us-east-1a"
    },
    {
      name              = "private-1b"
      cidr              = "10.200.16.0/20"
      availability_zone = "us-east-1b"
    }
  ]

  database_subnets = [
    {
      name              = "database-1a"
      cidr              = "10.200.51.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "database-1b"
      cidr              = "10.200.52.0/24"
      availability_zone = "us-east-1b"
    }
  ]

  # EKS Configuration
  k8s_version = "1.33"

}

module "vpc" {
  source               = "github.com/marciorbr/terraform-aws-vpc?ref=main"
  cidr_block           = local.cidr_block
  environment          = local.environment
  project_name         = local.project_name
  vpc_additional_cidrs = local.vpc_additional_cidrs
  public_subnets       = local.public_subnets
  private_subnets      = local.private_subnets
  database_subnets     = local.database_subnets
}

module "eks_cluster" {
  source          = "../"
  k8s_version     = local.k8s_version
  project_name    = local.project_name
  environment     = local.environment
  private_subnets = module.vpc.private_subnets

}