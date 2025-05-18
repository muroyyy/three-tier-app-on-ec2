############################
# 1. ALB Security Group
############################
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg"
  description = "Allow HTTP inbound traffic to ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

############################
# 2. Application Load Balancer
############################
resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.public_subnet_a_id, var.public_subnet_b_id]
  security_groups    = [aws_security_group.alb_sg.id]

  tags = {
    Name = "${var.project_name}-alb"
  }
}

############################
# 3. Target Group for Nginx (port 80)
############################
resource "aws_lb_target_group" "nginx_tg" {
  name     = "${var.project_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

############################
# 4. Register EC2 to Target Group
############################
resource "aws_lb_target_group_attachment" "nginx_attach" {
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = var.instance_id
  port             = 80
}

############################
# 5. Listener (HTTP port 80)
############################
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}
