// allow internet incomming traffic
resource "aws_security_group" "alb_sg" {
  count       = var.enabled && var.alb_enabled ? 1 : 0
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
  tags = merge(var.tags, { "Name" = "${var.label}-alb" })
}

resource "aws_security_group" "ecs_sg" {
  count       = var.enabled && var.ecs_enabled ? 1 : 0
  name        = "${var.label}-ecs"
  description = "Security group for ECS ${var.name}"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ecs_ports
    content {
      description     = "Connections from ALB"
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      security_groups = [aws_security_group.alb_sg.id]
    }
  }
  tags = merge(var.tags, { "Name" = "${var.label}-ecs" })
}