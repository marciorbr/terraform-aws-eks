resource "aws_eks_node_group" "on_demand" {

  cluster_name = aws_eks_cluster.main.name

  node_group_name = local.eks_node_group_name

  node_role_arn = aws_iam_role.eks_nodes_role.arn

  instance_types = var.on_demand_instance_types

  subnet_ids = var.private_subnets

  scaling_config {
    desired_size = lookup(var.on_demand_auto_scale_options, "desired")
    max_size     = lookup(var.on_demand_auto_scale_options, "max")
    min_size     = lookup(var.on_demand_auto_scale_options, "min")
  }

  capacity_type = "ON_DEMAND"

  labels = {
    "capacity/os"   = "AMAZON_LINUX"
    "capacity/arch" = "x86_64"
    "capacity/type" = "ON_DEMAND"
  }

  tags = {
    "kubernetes.io/cluster/${var.project_name}" = "owned"
  }

  depends_on = [
    # kubernetes_config_map.aws-auth
    aws_eks_access_entry.nodes
  ]

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }

  timeouts {
    create = "1h"
    update = "2h"
    delete = "2h"
  }

}