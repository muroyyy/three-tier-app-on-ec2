variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
}

variable "key_name" {
  description = "Your EC2 Key Pair Name"
}

variable "project_name" {
  default = "devops-app"
}
