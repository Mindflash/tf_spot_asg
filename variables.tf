#Boiler plate
variable "env" {}

variable "cidr_block" {
  type        = "string"
  description = "VPC Cidr block for incoming connections"
}

variable "vpc_id" {
  type        = "string"
  description = "ID of VPC to deploy into"
}

variable "subnets" {
  type        = "list"
  description = "list of subnets to add instances to"
}

variable "instance_type" {
  type    = "string"
  default = "t2.medium"
}

variable "service_name" {
  type = "string"
}

variable "ami_id" {
  type = "string"
}

variable "release_version" {
  type        = "string"
  description = "version of the software to deploy"
}

variable "max_size" {
  type        = "string"
  description = "max nodes in asg"
  default     = 5
}

variable "min_size" {
  type        = "string"
  description = "min nodes in asg"
  default     = 1
}

variable "target_group_arns" {
  type        = "list"
  description = "List of target groups to attache"
  default     = []
}

variable "load_balancers" {
  type    = "list"
  default = []
}

variable "key_name" {}

variable "region" {}

/*
CloudWatch configurations.
*/

variable "cpu_util_metric_name" {
  default = "CPUUtilization"
}

variable "cpu_util_period" {
  default = 60
}

variable "cpu_util_evaluation_periods" {
  default = 2
}

variable "cpu_util_threshold" {
  default = 80
}

variable "cpu_util_namespace" {
  default = "AWS/ECS"
}

variable "cpu_util_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "cpu_util_statistic" {
  default = "Average"
}

variable "memory_util_metric_name" {
  default = "MemoryUtilization"
}

variable "memory_util_period" {
  default = 60
}

variable "memory_util_evaluation_periods" {
  default = 2
}

variable "memory_util_threshold" {
  default = 80
}

variable "memory_util_namespace" {
  default = "AWS/ECS"
}

variable "memory_util_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "memory_util_statistic" {
  default = "Average"
}

variable "notification" {
  default = ["arn:aws:sns:us-west-2:1234567890:no-alarm"]
}
