#Boiler plate
variable "env" {}

variable "lock_table" {
  type = "map"
}

variable "remote_state" {
  type = "map"
}

variable "fleet_size" {}

variable "allocation_strategy" {
  type    = "string"
  default = "diversified"
}

variable "service_name" {
  type = "string"
}

variable "valid_until" {
  default = "2022-11-04T20:44:20Z"
}

variable "ami_id" {
  type = "string"
}

variable "target_groups" {
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
