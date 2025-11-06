resource "aws_sqs_queue" "karpenter" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name                       = "eks-karpenter-sqs-${local.name_suffix}"
  delay_seconds              = 0
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 60
}

resource "aws_sqs_queue_policy" "karpenter" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  queue_url = aws_sqs_queue.karpenter[0].id
  policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sqs:SendMessage"
      ],
      "Resource": [
        "${aws_sqs_queue.karpenter[0].arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_cloudwatch_event_rule" "karpenter_instance_terminate" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name        = "eks-karpenter-instance-terminate-${local.name_suffix}"
  description = var.project_name
  event_pattern = jsonencode({
    source = ["aws.autoscaling"]
    detail-type = [
      "EC2 Instance-terminate Lifecycle Action"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_instance_terminate" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  rule      = aws_cloudwatch_event_rule.karpenter_instance_terminate[0].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter[0].arn
}


resource "aws_cloudwatch_event_rule" "karpenter_scheduled_change" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name        = "eks-karpenter-scheduled-change-${local.name_suffix}"
  description = var.project_name
  event_pattern = jsonencode({
    source = ["aws.health"]
    detail-type = [
      "AWS Health Event"
    ]
    detail = {
      service = [
        "EC2"
      ]
      eventTypeCategory = [
        "scheduledChange"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "karpenter_scheduled_change" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  rule      = aws_cloudwatch_event_rule.karpenter_scheduled_change[0].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter[0].arn
}

resource "aws_cloudwatch_event_rule" "karpenter_spot_termination" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name        = "eks-karpenter-spot-termination-${local.name_suffix}"
  description = var.project_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Spot Instance Interruption Warning"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_spot_termination" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  rule      = aws_cloudwatch_event_rule.karpenter_spot_termination[0].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter[0].arn
}


resource "aws_cloudwatch_event_rule" "karpenter_rebalance" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name        = "eks-karpenter-rebalance-${local.name_suffix}"
  description = var.project_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance Rebalance Recommendation"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_rebalance" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  rule      = aws_cloudwatch_event_rule.karpenter_rebalance[0].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter[0].arn
}


resource "aws_cloudwatch_event_rule" "karpenter_state_change" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  name        = "eks-karpenter-state-change-${local.name_suffix}"
  description = var.project_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance State-change Notification"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_state_change" {

  count = length(var.karpenter_capacity) > 0 ? 1 : 0

  rule      = aws_cloudwatch_event_rule.karpenter_state_change[0].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter[0].arn
}