# target group
resource "aws_alb_target_group" "target-group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "team1-tg"
  port        = 80
  protocol    = "HTTP"
  #target_type = "alb"
  vpc_id      = aws_vpc.team1-vpc.id
}