output "aws_ecs_cluster_arn" {
    value = aws_ecs_cluster.this.arn
}

output "alb_dns_name" {
    value = aws_lb.this.dns_name
}