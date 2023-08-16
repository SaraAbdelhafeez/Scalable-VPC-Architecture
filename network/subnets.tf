resource "aws_subnet" "bastion_public_subnet" {
    depends_on = [
        aws_vpc.bastion_vpc
    ]
    vpc_id     = aws_vpc.bastion_vpc_cidr.id
    cidr_block = var.bastion_public_subnet_cidr
    map_public_ip_on_launch = true
    tags = {
        "Name" = "bastion-public-subnet"
    }
}

resource "aws_subnet" "apache_public_subnet_1" {
    depends_on = [
        aws_vpc.apache_vpc
    ]
    vpc_id     = aws_vpc.apache_vpc_cidr.id
    cidr_block = var.apache_public_subnet_1_cidr
    map_public_ip_on_launch = true
    tags = {
        "Name" = "apache-public-subnet-1"
    }
}
resource "aws_subnet" "apache_public_subnet_2" {
    depends_on = [
        aws_vpc.apache_vpc,
        aws_subnet.apache_public_subnet_1
    ]
    vpc_id     = aws_vpc.apache_vpc_cidr.id
    cidr_block = var.apache_public_subnet_2_cidr
    map_public_ip_on_launch = true
    tags = {
        "Name" = "apache-public-subnet-2"
    }
}

resource "aws_subnet" "apache_private_subnet_1" {
    depends_on = [
        aws_vpc.apache_vpc
    ]
    vpc_id     = aws_vpc.apache_vpc_cidr.id
    cidr_block = var.apache_private_subnet_1_cidr
    availability_zone = var.availability_zone_1
    tags = {
        "Name" = "apache-private-subnet-1"
    }
}
resource "aws_subnet" "apache_private_subnet_2" {
    depends_on = [
        aws_vpc.apache_vpc
    ]
    vpc_id     = aws_vpc.apache_vpc_cidr.id
    cidr_block = var.apache_private_subnet_2_cidr
    availability_zone = var.availability_zone_2
    tags = {
        "Name" = "apache-private-subnet-2"
    }
}
