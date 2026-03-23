variable "cluster_name" {
  type    = string
  default = "boutique-cluster"
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}
variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "tf-example"
}
