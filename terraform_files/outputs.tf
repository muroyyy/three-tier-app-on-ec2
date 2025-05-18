output "vpc_id" {
  value = module.networking.vpc_id
}

output "private_subnet_id" {
  value = module.networking.private_subnet_id
}

output "public_subnet_a_id" {
  value = module.networking.public_subnet_a_id
}

output "public_subnet_b_id" {
  value = module.networking.public_subnet_b_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "alb_dns" {
  value = module.alb.alb_dns
}