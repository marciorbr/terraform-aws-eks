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

  source = "../"

  providers = {
    helm    = helm.cluster_1
    kubectl = kubectl.cluster_1
  }

  k8s_version              = local.k8s_version
  project_name             = local.project_name
  environment              = local.environment
  public_subnets           = module.vpc.public_subnets_ids
  private_subnets          = module.vpc.private_subnets_ids
  vpc_id                   = module.vpc.vpc_id
  on_demand_instance_types = ["t3.medium"]
  on_demand_auto_scale_options = {
    desired = 2
    max     = 3
    min     = 2
  }
  addons = ["eks-pod-identity-agent", "vpc-cni", "kube-proxy", "coredns"]

  # custom_access_entries = [
  #   {
  #     name              = "custom-entry-1"
  #     principal_arn     = "arn:aws:iam::123456789012:role/CustomRole1"
  #     type              = "STANDARD"
  #     kubernetes_groups = ["cluster-admin"]
  #   }
  # ]

  # fargate_profiles = [
  #   {
  #     name      = "chip"
  #     namespace = "chip"
  #   }
  # ]

  karpenter_capacity = [
    {
      name               = "karpenter-dev"
      workload           = "dev"
      ami_family         = "AL2023"
      ami_ssm            = "/aws/service/eks/optimized-ami/1.33/amazon-linux-2023/x86_64/standard/recommended/image_id"
      instance_family    = ["t3", "t3a"]
      instance_sizes     = ["small", "medium"]
      capacity_type      = ["on-demand", "spot"]
      availability_zones = ["us-east-1a", "us-east-1b"]
    }
  ]

  enable_aws_lb_controller = true

  enable_nginx_controller_with_nlb_target_group_bind = true
}


module "eks_cluster_2" {

  source = "../"

  providers = {
    helm    = helm.cluster_2
    kubectl = kubectl.cluster_2
  }

  k8s_version              = local.k8s_version
  project_name             = local.project_name
  environment              = local.environment
  public_subnets           = module.vpc.public_subnets_ids
  private_subnets          = module.vpc.private_subnets_ids
  vpc_id                   = module.vpc.vpc_id
  on_demand_instance_types = ["t3.medium"]
  on_demand_auto_scale_options = {
    desired = 1
    max     = 3
    min     = 1
  }
  addons = ["eks-pod-identity-agent", "vpc-cni", "kube-proxy", "coredns"]


  enable_aws_lb_controller = true

  enable_nginx_controller_with_nlb_target_group_bind = true
}