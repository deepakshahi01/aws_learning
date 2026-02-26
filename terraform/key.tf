resource "tls_private_key" "rsa-4096-deepak" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deepak-key" {
  key_name   = "deepak-key"
  public_key = tls_private_key.rsa-4096-deepak.public_key_openssh
}

resource "local_file" "deepak-key-file" {
  content         = tls_private_key.rsa-4096-deepak.private_key_pem
  filename        = "${path.module}/../ansible/deepak.pem"
  file_permission = "0400"
}