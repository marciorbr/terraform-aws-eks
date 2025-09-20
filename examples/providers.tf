terraform {
  required_version = ">= 1.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = local.additional_aws_tags
  }
}

provider "helm" {
  kubernetes = {
    host                   = module.eks_cluster.eks_endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.eks_certificate_authority)
    token                  = module.eks_cluster.aws_eks_cluster_auth.token
  }
}