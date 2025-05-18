module "networking" {
  source = "./modules/networking"
  project_name = var.project_name
}

module "ec2" {
  source            = "./modules/ec2"
  project_name      = var.project_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  vpc_id            = module.networking.vpc_id
  private_subnet_id = module.networking.private_subnet_id
}

module "alb" {
  source             = "./modules/alb"
  project_name       = var.project_name
  vpc_id             = module.networking.vpc_id
  public_subnet_a_id = module.networking.public_subnet_a_id
  public_subnet_b_id = module.networking.public_subnet_b_id
  instance_id        = module.ec2.instance_id
}