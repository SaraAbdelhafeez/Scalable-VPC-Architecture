resource "  " "apache_asg" {
  name                 = "apache-asg"  
  min_size             = 2  
  max_size             = 4  
  desired_capacity     = 2  
  vpc_zone_identifier  = [var.apache_private_subnet_1_id, var.apache_private_subnet_2_id]  
  launch_template {
    id      = aws_launch_template.apache_template.id  
    version = "$Latest"  
  }
}