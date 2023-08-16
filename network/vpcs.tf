resource "aws_vpc" "bastion_vpc" {
  cidr_block = var.bastion_vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "bastion-vpc"
  }
  depends_on = [aws_iam_role_policy_attachment.vpc_role_attachment]
  iam_instance_profile {
    name = aws_iam_role.vpc_role.name
  }
}
resource "aws_vpc" "apache_vpc" {
  cidr_block = var.apache_vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "apache-vpc"
  }
  depends_on = [aws_iam_role_policy_attachment.vpc_role_attachment]
  iam_instance_profile {
    name = aws_iam_role.vpc_role.name
  }
}

