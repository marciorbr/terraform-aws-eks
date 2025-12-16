resource "aws_security_group_rule" "nodeports" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 30000
  to_port           = 32768
  protocol          = "tcp"
  description       = "Nodeports"
  type              = "ingress"
  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

resource "aws_security_group_rule" "custom_rules_cluster" {
  for_each = { for rule in var.custom_security_group_rule_cluster : rule.name => rule }

  cidr_blocks       = each.value.cidr_blocks
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  description       = each.value.description
  type              = each.value.type
  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}