output "eks_cluster_name" {
  description = "EKS Cluster name"
  value       = aws_eks_cluster.main.id
}

output "eks_endpoint" {
  description = "EKS Cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "eks_certificate_authority" {
  description = "EKS Cluster certificate authority data"
  value       = aws_eks_cluster.main.certificate_authority.0.data
}

output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.main.id
}

output "aws_eks_cluster_auth" {
  value     = data.aws_eks_cluster_auth.default
  sensitive = true
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "efs_security_group_id" {
  value = length(aws_security_group.efs) > 0 ? aws_security_group.efs[0].id : null
}