terraform {
  required_version = ">= 1.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.19.0"
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
  alias = "cluster_1"
  kubernetes = {
    host                   = module.eks_cluster.eks_endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.eks_certificate_authority)
    token                  = module.eks_cluster.aws_eks_cluster_auth.token
  }
}

provider "helm" {
  alias = "cluster_2"
  kubernetes = {
    host                   = module.eks_cluster_2.eks_endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster_2.eks_certificate_authority)
    token                  = module.eks_cluster_2.aws_eks_cluster_auth.token
  }
}

provider "kubectl" {
  alias                  = "cluster_1"
  host                   = module.eks_cluster.eks_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.eks_certificate_authority)
  token                  = module.eks_cluster.aws_eks_cluster_auth.token
}

provider "kubectl" {
  alias                  = "cluster_2"
  host                   = module.eks_cluster_2.eks_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster_2.eks_certificate_authority)
  token                  = module.eks_cluster_2.aws_eks_cluster_auth.token
}