resource "aws_security_group" "alb_sg" {
  name        = "${var.label}-alb"
  description = "Security group for Loadbalancer ${var.name}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

resource "aws_security_group" "ecs_sg" {
  name        = "${var.label}-ecs"
  description = "Security group for ECS ${var.name}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Connections from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  tags = var.tags
}


resource "aws_security_group" "rds_sg" {
  name        = "${var.label}-rds"
  description = "Security group for RDS ${var.name}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Connect from ECS"
    from_port       = var.rds_port
    to_port         = var.rds_port
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  tags = var.tags
}
