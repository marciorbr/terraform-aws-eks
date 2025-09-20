data "aws_eks_cluster_auth" "default" {
  name = aws_eks_cluster.main.id
}

data "aws_caller_identity" "current" {}