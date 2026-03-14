variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "tf-example"
}


variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
}


variable "public_subnet_ids" {
  type        = list(string)
  description = "قائمة بجميع الـ IDs للـ Public Subnets"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "قائمة بجميع الـ IDs للـ Private Subnets"
}