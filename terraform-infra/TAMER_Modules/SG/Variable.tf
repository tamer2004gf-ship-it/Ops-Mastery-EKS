variable "vpc_id" {
  type = string
}
#147.236.163.136

variable "MY_IP" {
  description = "List of CIDR blocks allowed for SSH "
  type        = list(string)
  default     = ["147.236.163.136/32"]
  
}