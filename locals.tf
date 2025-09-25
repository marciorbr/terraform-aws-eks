locals {
  name_suffix         = "${var.environment}-${var.project_name}"
  eks_cluster_name    = "eks-cluster-${local.name_suffix}"
  eks_node_group_name = "on-demand-${local.name_suffix}"
}