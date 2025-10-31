resource "aws_eks_access_entry" "nodes" {
  cluster_name  = aws_eks_cluster.main.id
  principal_arn = aws_iam_role.eks_nodes_role.arn
  type          = "EC2_LINUX"
}

resource "aws_eks_access_entry" "fargate" {
  count         = length(var.fargate_profiles) > 0 ? 1 : 0
  cluster_name  = aws_eks_cluster.main.id
  principal_arn = aws_iam_role.fargate[0].arn
  type          = "FARGATE_LINUX"
}