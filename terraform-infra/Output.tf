output "vpc_id" {
  value = module.vpc.vpc_id
}

#output "public_instance_ip" {
 # value = module.ec2.public_instance_public_ip
#}

output "nat_gateway_ip" {
  value = module.eip.eip_public_ip
}

# السطر 14
output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}

# السطر 18
output "private_subnet_ids" {
  value = module.subnet.private_subnet_ids
}
#output "security_group_id" {
 # value = module.security_group.security_group_id
#}
output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}