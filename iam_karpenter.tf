data "aws_iam_policy_document" "karpenter_assume_role" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks_oidc.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_oidc.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:karpenter:karpenter"]
    }
  }
}
resource "aws_iam_role" "karpenter" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name               = "eks-karpenter-role-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.karpenter_assume_role[0].json

}

data "aws_iam_policy_document" "karpenter" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "eks:DescribeCluster",
      "ec2:CreateLaunchTemplate",
      "ec2:CreateFleet",
      "ec2:CreateTags",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeInstances",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeImages",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeInstanceTypeOfferings",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeSpotPriceHistory",
      "pricing:GetProducts",
      "ec2:RunInstances",
      "ec2:TerminateInstances",
      "ec2:DeleteLaunchTemplate",
      "ssm:GetParameter",
      "iam:PassRole",
      "sqs:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "karpenter" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name   = "eks-karpenter-policy-${local.name_suffix}"
  policy = data.aws_iam_policy_document.karpenter[0].json
}

resource "aws_iam_role_policy_attachment" "karpenter" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  policy_arn = aws_iam_policy.karpenter[0].arn
  role       = aws_iam_role.karpenter[0].name
}