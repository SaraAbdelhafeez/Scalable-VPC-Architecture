module "compute" {
  source   = "./compute"
  key_name = var.key_name
  bastion_vpc_id = module.network.bastion_vpc_id
  bastion_public_subnet_id = module.network.bastion_public_subnet_id
  apache_vpc_id = module.network.apache_vpc_id
  apache_private_subnet_1_id = module.network.apache_private_subnet_1_id
  apache_private_subnet_2_id = module.network.apache_private_subnet_2_id
  apache_public_subnet_1_id = module.network.apache_public_subnet_1_id
  
 

}

module "network" {
  source                      = "./network"
  bastion_vpc_cidr            = var.bastion_vpc_cidr
  apache_vpc_cidr             = var.apache_vpc_cidr
  bastion_public_subnet_cidr  = var.bastion_public_subnet_cidr
  apache_public_subnet_1_cidr = var.apache_public_subnet_1_cidr
  apache_public_subnet_2_cidr = var.apache_public_subnet_2_cidr
  apache_private_subnet_1_cidr = var.apache_private_subnet_1_cidr
  apache_private_subnet_2_cidr = var.apache_private_subnet_2_cidr
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}