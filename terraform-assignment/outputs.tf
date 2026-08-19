output "instance_id" {
  value = aws_instance.web_server.id
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.assignment_bucket.bucket
}
