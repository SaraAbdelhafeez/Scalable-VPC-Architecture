resource "aws_instance" "bastion" {
    depends_on = [
        aws_key_pair.key_pair
    ]
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id     = var.bastion_public_subnet_id
    key_name = var.key_name
    associate_public_ip_address = true
    tags = {
        Name = "bastion"
    }

}

resource "aws_network_interface_sg_attachment" "bastion_sg_attachment" {
  security_group_id    = aws_security_group.bastion_sg.id
  network_interface_id = aws_instance.bastion.primary_network_interface_id
}