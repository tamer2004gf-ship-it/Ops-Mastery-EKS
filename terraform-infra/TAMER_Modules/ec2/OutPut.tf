output "public_instance_id" {
  description = "ID of the EC2 instance in public subnet"
  value       = aws_instance.public.id
}

output "public_instance_private_ip" {
  description = "Private IP address of the public EC2 instance"
  value       = aws_instance.public.private_ip
}

output "public_instance_public_ip" {
  description = "Public IP address of the public EC2 instance"
  value       = aws_instance.public.public_ip
}

output "private_instance_id" {
  description = "ID of the EC2 instance in private subnet"
  value       = aws_instance.private.id
}