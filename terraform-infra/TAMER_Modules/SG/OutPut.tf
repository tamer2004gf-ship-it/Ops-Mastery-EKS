output "security_group_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web_sg.id
}

output "web_sg_id" {
  description = "ID of the web security group (alias)"
  value       = aws_security_group.web_sg.id
}