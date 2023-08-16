resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name      # Create a key to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a key to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./${var.key_name}.pem"
  }

  provisioner "local-exec" { # make the key is not publicly viewable
    command = "chmod 400 sprints_key.pem"
  }


}