
output "eip_id" {
  description = "Elastic IP allocation ID"
  value       = aws_eip.this.id
}

output "allocation_id" {
  description = "Elastic IP allocation ID (alias)"
  value       = aws_eip.this.id
}

output "eip_public_ip" {
  description = "Elastic IP public IP address"
  value       = aws_eip.this.public_ip
}
