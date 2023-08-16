variable "key_name" {
  type = string
}

variable "env_region" {
  type = string
}


variable "state_bucket_name" {
  type = string
}

variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}

variable "bastion_vpc_cidr" {
  type = string
}
variable "apache_vpc_cidr" {
  type = string
}
variable "bastion_public_subnet_cidr" {
  type = string
}
variable "apache_public_subnet_1_cidr" {
  type = string
}
variable "apache_public_subnet_2_cidr" {
  type = string
}
variable "apache_private_subnet_1_cidr" {
  type = string
}
variable "apache_private_subnet_2_cidr" {
  type = string
}
variable "availability_zone_1" {
  type = string
}
variable "availability_zone_2" {
  type = string
}