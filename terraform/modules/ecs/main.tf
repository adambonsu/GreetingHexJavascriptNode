resource "aws_security_group" "ecs_service" {
    vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ecs_service" {
  security_group_id = aws_security_group.ecs_service.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.aws_security_group_port
  ip_protocol       = "tcp"
  to_port           = var.aws_security_group_port
}

resource "aws_vpc_security_group_ingress_rule" "ecs_service_accepts_alb_traffic" {
  security_group_id = aws_security_group.ecs_service.id
  referenced_security_group_id = aws_security_group.alb.id
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "ecs_service" {
  security_group_id = aws_security_group.ecs_service.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group" "alb" {
    vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_ecs_cluster" "this" {
    name = var.aws_ecs_cluster_name
}

resource "aws_ecs_task_definition" "this" {
    family = var.aws_ecs_task_definition_family
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = var.aws_ecs_task_definition_cpu
    memory                   = var.aws_ecs_task_definition_memory
    container_definitions = jsonencode([
        {
            name = var.aws_ecs_task_definition_container_name
            image = var.container_image
            environment = [{"name": "ALLOWED_HOSTS", "value": aws_lb.this.dns_name}]
            cpu = var.aws_ecs_task_definition_cpu
            essential = true
            memory = var.aws_ecs_task_definition_memory
            portMappings = [
                {
                    containerPort = var.aws_security_group_port
                    hostPort = var.aws_security_group_port
                }
            ]
            logConfiguration = {
                logDriver = "awslogs"
                options = {
                    awslogs-create-group = "true"
                    awslogs-group         = aws_cloudwatch_log_group.ecs_logs.name
                    awslogs-region        = var.region
                    awslogs-stream-prefix = "ecs"
                }
            }
        }
    ])

    execution_role_arn = var.execution_role_arn
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.aws_ecs_task_definition_family}"
  retention_in_days = var.aws_cloudwatch_log_retention_in_days

  lifecycle {
    ignore_changes = [ name ]
  }
}

resource "aws_lb" "this" {
    name = var.aws_lb_name
    internal = false
    load_balancer_type = "application"
    subnets = var.public_subnet_ids
    enable_deletion_protection = false
    security_groups = [aws_security_group.alb.id]

    lifecycle {
      ignore_changes = [ name ]
      create_before_destroy = true
    }
}

resource "aws_lb_target_group" "this" {
    name = var.aws_lb_target_group_name
    port = var.aws_security_group_port
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = var.vpc_id

    health_check {
        healthy_threshold = "2"
        protocol = "HTTP"
        interval = "30"
        matcher = "200-299"
        timeout = "5"
        path = "/"
        unhealthy_threshold = "2"
    }

    lifecycle {
      ignore_changes = [ name ]
      create_before_destroy = true
    }
  
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.this.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}

resource "aws_ecs_service" "this" {
    name = var.aws_ecs_service_name
    cluster = aws_ecs_cluster.this.id
    task_definition = aws_ecs_task_definition.this.arn
    desired_count = var.aws_ecs_service_desired_count
    launch_type = var.aws_ecs_service_lauch_type

    network_configuration {
        security_groups = [aws_security_group.ecs_service.id]
        subnets = var.public_subnet_ids
        assign_public_ip = var.aws_ecs_service_network_configuration_assign_public_ip
    }

    load_balancer {
        target_group_arn = aws_lb_target_group.this.arn
        container_name = var.aws_ecs_task_definition_container_name
        container_port = var.aws_security_group_port
    }
}

