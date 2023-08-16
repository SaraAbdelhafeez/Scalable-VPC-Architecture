resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "Transit Gateway for private communication"  
}


resource "aws_ec2_transit_gateway_vpc_attachment" "bastion_vpc_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.bastion_vpc.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "example_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.apache_vpc.id
}