variable "vpc_id" {
  description = "VPC id to place subnet into"
}

variable "security_group_id" {
  description = "security_group_id"
}

variable "ecs_cluster_id" {
  description = "ecs_cluster_id"
}

variable "lb_listener" {
  description = "lb_listener"
}
variable "app_count" {
  type = number
  default = 1
}
variable "target_group_id" {
  description = "target_group_id"
}
variable "subnet_private" {
  description = "subnet_private"
}