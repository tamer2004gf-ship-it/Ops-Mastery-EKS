variable "project_name" {
  type    = string
  default = "tf-example"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "MY_IP" {
  description = "Allowed IP for SSH"
  type        = list(string)
  default     = ["147.236.163.136/32"]
}

variable "ami_id" {
  type    = string
  default = "ami-0084a47cc718c111a"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_pair_name" {
  type    = string
  default = "tamer_new_key"
}

variable "cluster_name" {
  type = string
  default = "tamer-boutique-cluster"
}
variable "capacity_type" {
  type = string
  default = "ON_DEMAND"
}