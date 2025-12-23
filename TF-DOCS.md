<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.11.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.0.2 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.11.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 3.0.2 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.karpenter_instance_terminate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.karpenter_rebalance](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.karpenter_scheduled_change](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.karpenter_spot_termination](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.karpenter_state_change](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.karpenter_instance_terminate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.karpenter_rebalance](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.karpenter_scheduled_change](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.karpenter_spot_termination](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.karpenter_state_change](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_eks_access_entry.custom](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_entry.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_entry.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_access_entry) | resource |
| [aws_eks_addon.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_addon) | resource |
| [aws_eks_addon.eks-addons](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_cluster) | resource |
| [aws_eks_fargate_profile.this](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_fargate_profile) | resource |
| [aws_eks_node_group.on_demand](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_node_group) | resource |
| [aws_eks_pod_identity_association.aws_lb_controller](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_pod_identity_association) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.aws_lb_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.aws_lb_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.aws_lb_controller](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.efs_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.efs_csi_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_service_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.ingress](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/lb) | resource |
| [aws_lb_listener.main](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/lb_target_group) | resource |
| [aws_security_group.efs](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.custom_rules_cluster](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeports](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/security_group_rule) | resource |
| [aws_sqs_queue.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/sqs_queue_policy) | resource |
| [helm_release.alb_ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [helm_release.karpenter](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [helm_release.nginx_controller](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [kubectl_manifest.ec2_node_class](https://registry.terraform.io/providers/gavinbunney/kubectl/1.19.0/docs/resources/manifest) | resource |
| [kubectl_manifest.nodepool](https://registry.terraform.io/providers/gavinbunney/kubectl/1.19.0/docs/resources/manifest) | resource |
| [kubectl_manifest.target_binding_80](https://registry.terraform.io/providers/gavinbunney/kubectl/1.19.0/docs/resources/manifest) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/caller_identity) | data source |
| [aws_eks_addon_version.addon_version](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_addon_version) | data source |
| [aws_eks_addon_version.efs](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_addon_version) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.aws_lb_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_lb_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.efs_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_assume_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.karpenter_ami](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_aws_tags"></a> [additional\_aws\_tags](#input\_additional\_aws\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_addons"></a> [addons](#input\_addons) | List of EKS addons to install | `list(string)` | <pre>[<br/>  "eks-pod-identity-agent",<br/>  "coredns",<br/>  "vpc-cni",<br/>  "kube-proxy"<br/>]</pre> | no |
| <a name="input_cluster_log_types"></a> [cluster\_log\_types](#input\_cluster\_log\_types) | Map of log types to enable/disable | `map(bool)` | <pre>{<br/>  "api": true,<br/>  "audit": true,<br/>  "authenticator": true,<br/>  "controllerManager": true,<br/>  "scheduler": true<br/>}</pre> | no |
| <a name="input_custom_access_entries"></a> [custom\_access\_entries](#input\_custom\_access\_entries) | List of custom EKS access entries to create. | <pre>list(object({<br/>    name              = string<br/>    principal_arn     = string<br/>    type              = string<br/>    kubernetes_groups = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_custom_security_group_rule_cluster"></a> [custom\_security\_group\_rule\_cluster](#input\_custom\_security\_group\_rule\_cluster) | Custom security group rule for the EKS cluster | <pre>list(object({<br/>    name        = string<br/>    cidr_blocks = list(string)<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    description = string<br/>    type        = string<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_aws_lb_controller"></a> [enable\_aws\_lb\_controller](#input\_enable\_aws\_lb\_controller) | Enable AWS Load Balancer Controller | `bool` | `true` | no |
| <a name="input_enable_efs_csi"></a> [enable\_efs\_csi](#input\_enable\_efs\_csi) | Enable EFS CSI Driver for the EKS cluster | `bool` | `false` | no |
| <a name="input_enable_nginx_controller_with_nlb_target_group_bind"></a> [enable\_nginx\_controller\_with\_nlb\_target\_group\_bind](#input\_enable\_nginx\_controller\_with\_nlb\_target\_group\_bind) | Enable External AWS NLB with Ingress Nginx and Target Group Bind | `bool` | `false` | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Enable private access to the EKS API server endpoint | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Enable public access to the EKS API server endpoint | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_fargate_profiles"></a> [fargate\_profiles](#input\_fargate\_profiles) | List of Fargate profiles to create. Each profile is an object with name and namespace. | <pre>list(object({<br/>    name      = string<br/>    namespace = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The Kubernetes version for the EKS cluster | `string` | `"1.33"` | no |
| <a name="input_karpenter_capacity"></a> [karpenter\_capacity](#input\_karpenter\_capacity) | Karpenter capacity configuration, nodepool and ec2 node class. | <pre>list(object({<br/>    name               = string<br/>    workload           = string<br/>    ami_family         = string<br/>    ami_ssm            = string<br/>    instance_family    = list(string)<br/>    instance_sizes     = list(string)<br/>    capacity_type      = list(string)<br/>    availability_zones = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_on_demand_auto_scale_options"></a> [on\_demand\_auto\_scale\_options](#input\_on\_demand\_auto\_scale\_options) | Auto-scaling options for on-demand node group | `map(number)` | <pre>{<br/>  "desired": 2,<br/>  "max": 2,<br/>  "min": 2<br/>}</pre> | no |
| <a name="input_on_demand_instance_types"></a> [on\_demand\_instance\_types](#input\_on\_demand\_instance\_types) | List of instance types for on-demand nodes | `list(string)` | <pre>[<br/>  "t3.medium"<br/>]</pre> | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnet IDs | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy resources in | `string` | `"us-east-1"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID | `any` | n/a | yes |
| <a name="input_zonal_shift_enabled"></a> [zonal\_shift\_enabled](#input\_zonal\_shift\_enabled) | Enable zonal shift for the EKS cluster | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_caller_identity"></a> [aws\_caller\_identity](#output\_aws\_caller\_identity) | n/a |
| <a name="output_aws_eks_cluster_auth"></a> [aws\_eks\_cluster\_auth](#output\_aws\_eks\_cluster\_auth) | n/a |
| <a name="output_eks_certificate_authority"></a> [eks\_certificate\_authority](#output\_eks\_certificate\_authority) | EKS Cluster certificate authority data |
| <a name="output_eks_cluster_id"></a> [eks\_cluster\_id](#output\_eks\_cluster\_id) | EKS Cluster ID |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | EKS Cluster name |
| <a name="output_eks_endpoint"></a> [eks\_endpoint](#output\_eks\_endpoint) | EKS Cluster endpoint |
<!-- END_TF_DOCS -->