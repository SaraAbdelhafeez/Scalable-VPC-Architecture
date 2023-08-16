resource "aws_vpc" "bastion_vpc" {
  cidr_block = var.bastion_vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "bastion-vpc"
  }
}
resource "aws_vpc" "apache_vpc" {
  cidr_block = var.apache_vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "apache-vpc"
  }
}

