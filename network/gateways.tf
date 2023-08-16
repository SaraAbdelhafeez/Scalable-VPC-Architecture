resource "aws_internet_gateway" "bastion_igw" {
  depends_on = [
        aws_vpc.bastion_vpc,
        aws_subnet.bastion_public_subnet
    ]
  vpc_id = aws_vpc.bastion_vpc.id

  tags = {
    Name = "bastion-igw"
  }
}
resource "aws_internet_gateway" "apache_igw" {
  depends_on = [
        aws_vpc.apache_vpc,
        aws_subnet.apache_public_subnet_1,
        aws_subnet.apache_public_subnet_2
    ]
  vpc_id = aws_vpc.apache_vpc.id

  tags = {
    Name = "apache-igw"
  }
}


# Creating an Elastic IP for the NAT Gateway!
resource "aws_eip" "ngw_eip" {
  depends_on = [
    aws_route_table_association.apache_public_route_association_2
  ]
  vpc = true
}

# Creating a NAT Gateway!
resource "aws_nat_gateway" "apache_ngw" {
  depends_on = [
    aws_eip.ngw_eip
  ]

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.ngw_eip.id
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.apache_public_subnet_2.id
  tags = {
    Name = "Nat-Gateway"
  }
}

