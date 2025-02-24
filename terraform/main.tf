provider "aws" {
    region = "var.aws_region"
}

variable "aws_region" {
    type = "string"
    default = "eu-west-2"
    description = "The AWS region to deploy resources"
}

module "vpc" {
    source = "./modules/vpc"
}

module "ecs" {
    source = "./modules/ecs"
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.vpc.public_subnet_ids
    container_image = var.container_image
}

output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
}

output "alb_dns_name" {
    value = module.ecs.alb_dns_name
}