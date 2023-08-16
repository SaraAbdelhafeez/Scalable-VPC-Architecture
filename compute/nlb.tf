resource "aws_lb" "apache_nlb" {
  name               = "apache-nlb"  
  subnets            = [apache_public_subnet_1_id]  
  load_balancer_type = "network"  

  enable_deletion_protection = true  
}

resource "aws_lb_listener" "apache_nlb_listener" {
  load_balancer_arn = aws_lb.apache_nlb.arn  
  port              = 80 
  protocol          = "TCP"  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apache_tg.arn  
  }
}