output "lb_dns_name" {
  value = aws_lb.default.dns_name
}

output "security_group_id" {
  value = aws_security_group.lb.id
}

output "target_group_id" {
  value = aws_lb_target_group.hello_world.id
}

output "lb_listener" {
  value = aws_lb_listener.hello_world
}