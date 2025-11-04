# Defines the assume role policy for the Karpenter IAM role
data "aws_iam_policy_document" "karpenter_assume_role" {
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

# Creates the IAM role for Karpenter
resource "aws_iam_role" "karpenter" {
  name = "eks-karpenter-role-${local.name_suffix}"

  assume_role_policy = data.aws_iam_policy_document.karpenter_assume_role.json

}

# Defines the IAM policy for Karpenter
data "aws_iam_policy_document" "karpenter" {
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

# Creates the IAM policy for Karpenter
resource "aws_iam_policy" "karpenter" {
  name   = "eks-karpenter-policy-${local.name_suffix}"
  policy = data.aws_iam_policy_document.karpenter.json
}

# Attaches the Karpenter policy to the Karpenter role
resource "aws_iam_role_policy_attachment" "karpenter" {
  policy_arn = aws_iam_policy.karpenter.arn
  role       = aws_iam_role.karpenter.name
}