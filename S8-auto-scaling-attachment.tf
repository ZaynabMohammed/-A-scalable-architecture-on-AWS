resource "aws_autoscaling_attachment" "alb-attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto-grp.id
  # ALB Target Group attachment
  lb_target_group_arn    = aws_lb_target_group.ALB-target-grp.arn
}
