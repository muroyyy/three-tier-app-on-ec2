variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
}

variable "key_name" {
  description = "Your EC2 Key Pair Name"
}

variable "project_name" {
  description = "Common name prefix for all resources"
  default     = "devops-app"
}