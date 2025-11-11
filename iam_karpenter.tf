data "aws_iam_policy_document" "karpenter_assume_role" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
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

resource "aws_eks_pod_identity_association" "karpenter" {
  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  cluster_name    = aws_eks_cluster.main.name
  namespace       = "karpenter"
  service_account = "karpenter"
  role_arn        = aws_iam_role.karpenter[0].arn
}
