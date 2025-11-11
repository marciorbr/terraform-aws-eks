resource "helm_release" "alb_ingress_controller" {

  count = var.enable_aws_lb_controller ? 1 : 0

  name             = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-load-balancer-controller"
  namespace        = "kube-system"
  create_namespace = true

  set = [
    {
      name  = "clusterName"
      value = aws_eks_cluster.main.name
    },

    {
      name  = "serviceAccount.create"
      value = true
    },

    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
    },

    {
      name  = "region"
      value = var.region
    },

    {
      name  = "vpcId"
      value = var.vpc_id
    },
  ]

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_pod_identity_association.aws_lb_controller
  ]
}