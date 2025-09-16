<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/eks_cluster) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_role](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_service_policy](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.cluster](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.nodes](https://registry.terraform.io/providers/hashicorp/aws/6.11.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_log_types"></a> [cluster\_log\_types](#input\_cluster\_log\_types) | Map of log types to enable/disable | `map(bool)` | <pre>{<br/>  "api": true,<br/>  "audit": true,<br/>  "authenticator": true,<br/>  "controllerManager": true,<br/>  "scheduler": true<br/>}</pre> | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Enable private access to the EKS API server endpoint | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The Kubernetes version for the EKS cluster | `string` | `"1.33"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->