data "aws_eks_cluster" "this" {
  name = aws_eks_cluster.main.name
}

data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.main.name
}

data "tls_certificate" "eks_oidc_tls_certificate" {
  url = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
  url             = data.aws_eks_cluster.this.identity[0].oidc[0].issuer

  tags = {
    Name        = "eks-oidc-${local.name_suffix}"
    Environment = var.environment
  }
}