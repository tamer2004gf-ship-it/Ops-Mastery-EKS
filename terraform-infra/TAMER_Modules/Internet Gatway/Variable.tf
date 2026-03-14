variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "tf-example"
}


variable "vpc_id" {
  description = "VPC ID to attach Internet Gateway"
  type        = string
}
