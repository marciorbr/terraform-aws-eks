resource "aws_lb" "ingress" {

  count = var.enable_nginx_controller_with_nlb_target_group_bind ? 1 : 0

  name               = "eks-aws-nlb-${local.name_suffix}"
  internal           = false
  load_balancer_type = "network"

  subnets = var.public_subnets

  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false

  tags = {
    Name = var.project_name
  }

}

resource "aws_lb_target_group" "main" {

  count = var.enable_nginx_controller_with_nlb_target_group_bind ? 1 : 0

  name     = "eks-aws-nlb-tg-${local.name_suffix}"
  port     = 30080
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "main" {

  count = var.enable_nginx_controller_with_nlb_target_group_bind ? 1 : 0

  load_balancer_arn = aws_lb.ingress[0].arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[0].arn
  }
}