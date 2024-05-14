resource "aws_lb" "example" {
  name               =  "${var.commenname}loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [module.network.subnetpub1.id,module.network.subnetpub2.id]

  tags = {
    Name = "${var.commenname}loadbalancer"
  }
}

resource "aws_lb_target_group" "example" {
  name     = "example-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }
}

resource "aws_security_group" "alb_to_ec2_sg" {
  name        = "${var.commenname}-alb"
  vpc_id      = module.network.vpc_id

  // Allow inbound traffic from ALB
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from any source
  }

  // Allow outbound traffic to ALB
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to any destination
  }

  tags = {
    Name = "${var.commenname}-alb"
  }
}

