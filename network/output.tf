output "bastion_vpc_id" {
    value = aws_vpc.bastion_vpc.id
}

output "apache_vpc_id" {
    value = aws_vpc.apache_vpc.id
}

output "bastion_public_subnet_id" {
    value = aws_subnet.bastion_public_subnet.id
}

output "apache_private_subnet_1_id" {
    value = aws_subnet.apache_private_subnet_1.id
}

output "apache_private_subnet_2_id" {
    value = aws_subnet.apache_private_subnet_2.id
}

output "apache_public_subnet_1_id" {
    value = aws_subnet.apache_public_subnet_1.id
}