data "aws_eks_addon_version" "addon_version" {

  for_each = toset(var.addons)

  addon_name         = each.value
  kubernetes_version = aws_eks_cluster.main.version
  most_recent        = true
}

resource "aws_eks_addon" "eks-addons" {

  for_each = toset(var.addons)

  cluster_name  = aws_eks_cluster.main.id
  addon_name    = each.value
  addon_version = data.aws_eks_addon_version.addon_version[each.value].version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_eks_node_group.on_demand
  ]
}

// EFS CSI
data "aws_eks_addon_version" "efs" {

  count = var.enable_efs_csi ? 1 : 0

  addon_name         = "aws-efs-csi-driver"
  kubernetes_version = aws_eks_cluster.main.version
  most_recent        = true
}

resource "aws_eks_addon" "efs_csi" {

  count = var.enable_efs_csi ? 1 : 0

  cluster_name = aws_eks_cluster.main.name
  addon_name   = "aws-efs-csi-driver"

  addon_version               = data.aws_eks_addon_version.efs[0].version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_eks_access_entry.nodes
  ]
}