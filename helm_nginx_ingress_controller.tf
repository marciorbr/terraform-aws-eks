resource "helm_release" "nginx_controller" {

  count = var.enable_nginx_controller_with_nlb_target_group_bind ? 1 : 0

  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.11.3"

  create_namespace = true

  set = [
    {
      name  = "controller.service.internal.enabled"
      value = "true"
    },

    {
      name  = "controller.publishService.enable"
      value = "true"
    },

    {
      name  = "controller.service.type"
      value = "NodePort"
    },

    {
      name  = "controller.service.nodePorts.http"
      value = "30080"
    },

    {
      name  = "controller.service.nodePorts.https"
      value = "30443"
    },

    {
      name  = "controller.autoscaling.enabled"
      value = "true"
    },

    {
      name  = "controller.autoscaling.minReplicas"
      value = 2
    },

    {
      name  = "controller.autoscaling.maxReplicas"
      value = 5
    },

    {
      name  = "controller.resources.requests.cpu"
      value = "250m"
    },

    {
      name  = "controller.resources.requests.memory"
      value = "256Mi"
    },

    {
      name  = "controller.resources.limits.cpu"
      value = "500m"
    },

    {
      name  = "controller.resources.limits.memory"
      value = "512Mi"
    },

    {
      name  = "controller.kind"
      value = "Deployment"
    }
  ]

  depends_on = [
    helm_release.karpenter
  ]
}

resource "kubectl_manifest" "target_binding_80" {

  count = var.enable_nginx_controller_with_nlb_target_group_bind ? 1 : 0

  yaml_body = <<YAML
apiVersion: elbv2.k8s.aws/v1beta1
kind: TargetGroupBinding
metadata:
  name: ingress-nginx
  namespace: ingress-nginx
spec:
  serviceRef:
    name: ingress-nginx-controller
    port: 80
  targetGroupARN: ${aws_lb_target_group.main[0].arn}
  targetType: instance
YAML

  depends_on = [
    helm_release.nginx_controller
  ]
}