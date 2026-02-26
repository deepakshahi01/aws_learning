data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "deepak-instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.deepak-key.key_name
  subnet_id                   = aws_subnet.deepak-subnet.id
  vpc_security_group_ids      = [aws_security_group.deepak-sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "deepak-instance"
  }
}

resource "aws_security_group" "deepak-sg" {
  name   = "deepak-sg"
  vpc_id = aws_vpc.deepak.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "deepak-sg"
  }

}
resource "null_resource" "run_ansible" {
  depends_on = [
    aws_instance.deepak-instance
  ]
  provisioner "local-exec" {
    command     = "ansible-playbook setup.yaml"
    working_dir = "../ansible"
  }
}


