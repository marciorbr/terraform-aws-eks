resource "aws_eks_cluster" "main" {
  name    = "eks-cluster-${local.name_suffix}"
  version = var.k8s_version

  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {

    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = true

    subnet_ids = var.private_subnets
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  enabled_cluster_log_types = [
    for log_type, enabled in var.cluster_log_types : log_type if enabled
  ]

  zonal_shift_config {
    enabled = var.zonal_shift_enabled
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy
  ]

  tags = {
    Name                                                     = "eks-cluster-${local.name_suffix}"
    Environment                                              = var.environment
    "kubernetes.io/cluster/eks-cluster-${local.name_suffix}" = "shared"
  }

}