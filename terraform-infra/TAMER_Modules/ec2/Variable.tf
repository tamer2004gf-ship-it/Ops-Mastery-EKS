variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-068c0051b15cdb816"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of the AWS key pair for EC2 instances"
  type        = string
  default     = "EC2_SSH_KEY"
}


variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}