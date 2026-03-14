variable "project_name" {
  type    = string
  default = "tf-example"
}

variable "allocation_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}