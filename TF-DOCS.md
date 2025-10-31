<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.11.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.11.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 3.0.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_access_entry.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_entry.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_access_entry) | resource |
| [aws_eks_addon.eks-addons](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_cluster) | resource |
| [aws_eks_fargate_profile.this](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_fargate_profile) | resource |
| [aws_eks_node_group.on_demand](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.eks_oidc](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_service_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/3.0.2/docs/resources/release) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/caller_identity) | data source |
| [aws_eks_addon_version.addon_version](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_addon_version) | data source |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.cluster](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.fargate](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.eks_oidc_tls_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_aws_tags"></a> [additional\_aws\_tags](#input\_additional\_aws\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_addons"></a> [addons](#input\_addons) | List of EKS addons to install | `list(string)` | <pre>[<br/>  "coredns",<br/>  "vpc-cni",<br/>  "kube-proxy"<br/>]</pre> | no |
| <a name="input_cluster_log_types"></a> [cluster\_log\_types](#input\_cluster\_log\_types) | Map of log types to enable/disable | `map(bool)` | <pre>{<br/>  "api": true,<br/>  "audit": true,<br/>  "authenticator": true,<br/>  "controllerManager": true,<br/>  "scheduler": true<br/>}</pre> | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Enable private access to the EKS API server endpoint | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Enable public access to the EKS API server endpoint | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_fargate_profiles"></a> [fargate\_profiles](#input\_fargate\_profiles) | Lista de fargate profiles para criar, Cada profile e um objeto com nome do profile e qual namespace sera criado. | <pre>list(object({<br/>    name      = string<br/>    namespace = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The Kubernetes version for the EKS cluster | `string` | `"1.33"` | no |
| <a name="input_on_demand_auto_scale_options"></a> [on\_demand\_auto\_scale\_options](#input\_on\_demand\_auto\_scale\_options) | Auto-scaling options for on-demand node group | `map(number)` | <pre>{<br/>  "desired": 2,<br/>  "max": 2,<br/>  "min": 2<br/>}</pre> | no |
| <a name="input_on_demand_instance_types"></a> [on\_demand\_instance\_types](#input\_on\_demand\_instance\_types) | List of instance types for on-demand nodes | `list(string)` | <pre>[<br/>  "t3.medium"<br/>]</pre> | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy resources in | `string` | `"us-east-1"` | no |
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