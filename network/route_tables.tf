# bastion public route table configuration

resource "aws_route_table" "bastion_public_table" {
    depends_on = [
        aws_vpc.bastion_vpc,
        aws_internet_gateway.bastion_igw
    ]
    vpc_id = aws_vpc.bastion_vpc.id
    tags = {
        "Name" = "bastion-public-table"
    }
}

resource "aws_route" "bastion_public_route" {
    route_table_id            = aws_route_table.bastion_public_table.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bastion_igw.id
    transit_gateway_id        = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route_table_association" "bastion_public_route_association" {
    depends_on = [
    aws_vpc.bastion_vpc,
    aws_subnet.aws_subnet.bastion_public_subnet,
    aws_route_table.bastion_public_table
  ]
    subnet_id      = aws_subnet.bastion_public_subnet.id
    route_table_id = aws_route_table.bastion_public_table.id
}


# apache route tables configuration

resource "aws_route_table" "apache_public_table" {
    depends_on = [
        aws_vpc.apache_vpc,
        aws_internet_gateway.apache_igw
    ]
    vpc_id = aws_vpc.apache_vpc.id
    tags = {
        "Name" = "apache-public-table"
    }
}

resource "aws_route" "apache_public_route" {
    route_table_id            = aws_route_table.apache_public_table.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.apache_igw.id
    transit_gateway_id        = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route_table_association" "apache_public_route_association_1" {
    depends_on = [
    aws_vpc.apache_vpc,
    aws_subnet.aws_subnet.apache_public_subnet_1,
    aws_route_table.apache_public_table
  ]
    subnet_id      = aws_subnet.apache_public_subnet_1.id
    route_table_id = aws_route_table.apache_public_table.id
}

resource "aws_route_table_association" "apache_public_route_association_2" {
    depends_on = [
    aws_vpc.apache_vpc,
    aws_subnet.aws_subnet.apache_public_subnet_2,
    aws_route_table.apache_public_table
  ]
    subnet_id      = aws_subnet.apache_public_subnet_2.id
    route_table_id = aws_route_table.apache_public_table.id
}


    ################################

resource "aws_route_table" "apache_private_table" {
    depends_on = [
        aws_vpc.apache_vpc,
        aws_internet_gateway.apache_ngw
    ]
    vpc_id = aws_vpc.apache_vpc.id
    tags = {
        "Name" = "apache-private-table"
    }
}


resource "aws_route" "apache_private_route" {
    route_table_id            = aws_route_table.apache_private_table.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.apache_ngw.id
    transit_gateway_id        = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route_table_association" "apache_private_route_association_1" {
    depends_on = [
    aws_vpc.apache_vpc,
    aws_subnet.aws_subnet.apache_private_subnet_1,
    aws_route_table.apache_private_table
  ]
    subnet_id      = aws_subnet.apache_private_subnet_1.id
    route_table_id = aws_route_table.apache_private_table.id
}

resource "aws_route_table_association" "apache_private_route_association_2" {
    depends_on = [
    aws_vpc.apache_vpc,
    aws_subnet.aws_subnet.apache_private_subnet_2,
    aws_route_table.apache_private_table
  ]
    subnet_id      = aws_subnet.apache_private_subnet_2.id
    route_table_id = aws_route_table.apache_private_table.id
}

