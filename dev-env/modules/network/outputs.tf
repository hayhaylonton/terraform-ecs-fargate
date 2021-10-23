output "vpc_id" {
  value = aws_vpc.default.id
}

output "subnet_public" {
  value = aws_subnet.public
}

output "subnet_private" {
  value = aws_subnet.private
}