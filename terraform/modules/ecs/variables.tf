variable "vpc_id" {
    description = "VPC ID"
    type        = string
}

variable "aws_security_group_port" {
    description = "port number"
    type        = number
}

variable "aws_ecs_cluster_name" {
    description = "Cluster Name"
    type        = string
}

variable "region" {
    description = "Region"
    type        = string
}

variable "aws_ecs_task_definition_family" {
    description = "Task Definition Family"
    type        = string
}

variable "aws_ecs_task_definition_container_name" {
    description = "Container Name"
    type        = string
}

variable "container_image" {
    description = "Container Image"
    type        = string
}

variable "execution_role_arn" {
    description = "Execution Role ARN"
    type        = string
}

variable "aws_lb_name" {
    description = "Load Balancer Name"
    type        = string
}
  
variable "public_subnet_ids" {
    description = "CIDR blocks for the public subnets"
    type        = list(string)
}

variable "aws_lb_target_group_name" {
    description = "Target Group Name"
    type        = string
}

variable "aws_ecs_service_name" {
    description = "Service Name"
    type        = string
}

variable "aws_ecs_service_desired_count" {
    description = "Desired Count"
    type        = number
}

variable "aws_ecs_service_lauch_type" { 
    description = "Launch Type"
    type        = string
}

variable "aws_ecs_service_network_configuration_assign_public_ip" {
    description = "Assign Public IP"
    type        = bool
}

variable "aws_ecs_service_load_balancer_container_name" { 
    description = "Container Name"
    type        = string
}

variable "aws_ecs_task_definition_memory" { 
    description = "Memory"
    type        = number
}

variable "aws_ecs_task_definition_cpu" {
    description = "Memory"
    type        = number
}

variable "aws_cloudwatch_log_retention_in_days" {
    description = "Cloudwatch Log Retention in days"
    type        = number
}