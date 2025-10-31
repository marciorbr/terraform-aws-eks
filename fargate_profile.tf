resource "aws_eks_fargate_profile" "this" {
  for_each = { for profile in var.fargate_profiles : profile.name => profile }

  cluster_name         = aws_eks_cluster.main.name
  fargate_profile_name = each.value.name

  pod_execution_role_arn = aws_iam_role.fargate[0].arn

  subnet_ids = var.private_subnets

  selector {
    namespace = each.value.namespace
  }
}