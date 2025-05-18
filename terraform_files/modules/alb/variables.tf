variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_a_id" {
  description = "Public subnet A ID"
  type        = string
}

variable "public_subnet_b_id" {
  description = "Public subnet B ID"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID to register with target group"
  type        = string
}
