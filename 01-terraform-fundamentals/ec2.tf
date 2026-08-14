


# EC2 instance
resource "aws_instance" "my_instance" {
  key_name                    = aws_key_pair.my_key.key_name
  instance_type               = "t2.micro"
  ami                         = "ami-01a00762f46d584a1" #ubuntu
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.my_security_group.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"

  }

  tags = {
    Name = "My-Web-Server"
  }

}
