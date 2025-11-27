variable "project_name" {
  description = "The name of the project"
  type        = string

}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"

}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string

}

variable "additional_aws_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}

}

variable "k8s_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"

}

variable "vpc_id" {
  description = "The VPC ID"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet IDs"
}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS API server endpoint"
  type        = bool
  default     = true

}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS API server endpoint"
  type        = bool
  default     = true

}

variable "cluster_log_types" {
  description = "Map of log types to enable/disable"
  type        = map(bool)
  default = {
    api               = true
    audit             = true
    authenticator     = true
    controllerManager = true
    scheduler         = true
  }
}

variable "zonal_shift_enabled" {
  description = "Enable zonal shift for the EKS cluster"
  type        = bool
  default     = false

}

variable "on_demand_instance_types" {
  description = "List of instance types for on-demand nodes"
  type        = list(string)
  default     = ["t3.medium"]

}

variable "on_demand_auto_scale_options" {
  description = "Auto-scaling options for on-demand node group"
  type        = map(number)
  default = {
    desired = 2
    max     = 2
    min     = 2
  }

}

variable "addons" {
  type        = list(string)
  default     = ["eks-pod-identity-agent", "coredns", "vpc-cni", "kube-proxy"]
  description = "List of EKS addons to install"

  validation {
    condition = alltrue([
      for addon in var.addons : contains([
        "eks-pod-identity-agent",
        "vpc-cni",
        "coredns",
        "kube-proxy"
      ], addon)
    ])
    error_message = "Each addon name must be one of: eks-pod-identity-agent, coredns, vpc-cni, kube-proxy"
  }
}

variable "fargate_profiles" {
  description = "Lista de fargate profiles para criar, Cada profile e um objeto com nome do profile e qual namespace sera criado."
  type = list(object({
    name      = string
    namespace = string
  }))
  default = []
}

variable "karpenter_capacity" {
  description = "Karpenter capacity configuração, nodepool e ec2 node class."
  type = list(object({
    name               = string
    workload           = string
    ami_family         = string
    ami_ssm            = string
    instance_family    = list(string)
    instance_sizes     = list(string)
    capacity_type      = list(string)
    availability_zones = list(string)
  }))
  default = []
}

variable "enable_aws_lb_controller" {
  description = "Enable AWS Load Balancer Controller"
  type        = bool
  default     = true
}

variable "enable_nginx_controller_with_nlb_target_group_bind" {
  description = "Enable External AWS NLB with Ingress Nginx and Target Group Bind"
  type        = bool
  default     = false
}