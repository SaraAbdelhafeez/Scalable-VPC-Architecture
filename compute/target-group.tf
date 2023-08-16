resource "aws_lb_target_group" "apache_tg" {
  name        = "apache-tg"  
  port        = 80  
  protocol    = "TCP"  
  vpc_id      = var.apache_vpc_id  

  target_type = "ip"  

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "TCP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
  }
}

resource "aws_lb_target_group_attachment" "apache_tg_attachment" {
  target_group_arn = aws_lb_target_group.apache_tg.arn  
  target_id        = aws_autoscaling_group.apache_asg.id  
  port             = 80  
}