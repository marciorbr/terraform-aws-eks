resource "helm_release" "karpenter" {
  namespace        = "karpenter"
  create_namespace = true

  name       = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "1.0.8"

  set = [
    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
      value = aws_iam_role.karpenter.arn
    },

    {
      name  = "settings.clusterName"
      value = aws_eks_cluster.main.name
    },

    {
      name  = "settings.clusterEndpoint"
      value = aws_eks_cluster.main.endpoint
    },

    {
      name  = "aws.defaultInstanceProfile"
      value = aws_iam_instance_profile.nodes.name
    },

    # {
    #   name  = "settings.interruptionQueue"
    #   value = aws_sqs_queue.karpenter.name
    # }
  ]

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.on_demand
  ]

}