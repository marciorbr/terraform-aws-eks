data "aws_iam_policy_document" "fargate" {
  count   = length(var.fargate_profiles) > 0 ? 1 : 0
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks-fargate-pods.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "fargate" {
  count              = length(var.fargate_profiles) > 0 ? 1 : 0
  name               = "eks-fargate-iam-role-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.fargate[0].json
}

resource "aws_iam_role_policy_attachment" "fargate" {
  count      = length(var.fargate_profiles) > 0 ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.fargate[0].name
}