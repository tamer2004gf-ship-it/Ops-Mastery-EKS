
output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway (alias)"
  value       = aws_internet_gateway.main.id
}
