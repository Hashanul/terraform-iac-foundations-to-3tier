output "print_public_ip" {

  value = aws_instance.my_instance.public_ip

}

output "print_public_dns" {

  value = aws_instance.my_instance.public_dns

}

output "print_private_ip" {

  value = aws_instance.my_instance.private_ip

}