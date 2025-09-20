resource "helm_release" "kube_state_metrics" {
  name             = "kube-state-metrics"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-state-metrics"
  namespace        = "kube-system"
  create_namespace = true

  version = "6.3.0"

  set = [
    {
      name  = "apiService.create"
      value = "true"
    },

    {
      name  = "metricLabelsAllowlist[0]"
      value = "nodes=[*]"
    },

    {
      name  = "metricAnnotationsAllowList[0]"
      value = "nodes=[*]"
    },
  ]

  depends_on = [
    aws_eks_cluster.main
  ]
}