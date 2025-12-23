data "aws_iam_policy_document" "efs_role" {

  count = var.enable_efs_csi ? 1 : 0

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "efs_role" {

  count = var.enable_efs_csi ? 1 : 0

  assume_role_policy = data.aws_iam_policy_document.efs_role[0].json
  name               = "eks-efs-csi-role-${local.name_suffix}"
}

resource "aws_iam_role_policy_attachment" "efs_csi_role" {

  count = var.enable_efs_csi ? 1 : 0

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
  role       = aws_iam_role.efs_role[0].name
}

resource "aws_eks_pod_identity_association" "efs_csi" {

  count = var.enable_efs_csi ? 1 : 0

  cluster_name    = aws_eks_cluster.main.name
  namespace       = "kube-system"
  service_account = "efs-csi-controller-sa"
  role_arn        = aws_iam_role.efs_role[0].arn
}