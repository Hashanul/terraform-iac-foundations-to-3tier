


# EC2 instance
resource "aws_instance" "my_instance" {
  key_name                    = aws_key_pair.my_key.key_name
  instance_type               = var.ec2_instance_type
  ami                         = var.ec2_ami_id
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.my_security_group.id]
  user_data                   = file("${path.module}/install_nginx.sh")
  user_data_replace_on_change = true

  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "My-Web-Server"
  }

}
