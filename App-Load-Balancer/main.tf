provider "aws" {
  region = "us-west-2"  # Specify your desired AWS region
}

# defines the AWS Application Load Balancer (ALB) resource
resource "aws_lb" "my_load_balancer" {
  name               = "test-app-load-balancer"
  internal           = false  # Set to true for internal ALB
  load_balancer_type = "application"
  subnets            = ["subnet-0bb5ec94ca757154b", "subnet-0ad361637de63e0d3"]  # Replace with your subnet IDs
  enable_deletion_protection = false  # Set to true to enable deletion protection
}

# defines the listener for the ALB.
resource "aws_lb_listener" "my_app_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn # created above
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body      = "OK"
    }
  }
}

# defines an AWS security group for the load balancer
resource "aws_security_group" "lb_sg" {
  name_prefix = "lb_sg_"
}

# defines an ingress rule for the security group. It allows incoming traffic on port 80 (HTTP) from any source (CIDR block 0.0.0.0/0).
resource "aws_security_group_rule" "lb_sg_ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb_sg.id
}

# defines an egress rule for the security group. It allows outgoing traffic to any destination on any port (CIDR block 0.0.0.0/0). 
resource "aws_security_group_rule" "lb_sg_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1" # -1 represents all protocol for egress
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb_sg.id
}
