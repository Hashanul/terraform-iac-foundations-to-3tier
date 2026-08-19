# key pair (login)

resource "aws_key_pair" "assignment_key" {
  key_name   = "ssh-assi-key"
  public_key = file("ssh-assi-key.pub")

}


# EC2 Instance

resource "aws_instance" "web_server" {
    key_name = aws_key_pair.assignment_key.key_name
  ami           = "ami-0b6d9d3d33ba97d99" # Ubuntu (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformAssignment"
  }
}

# Random ID for Unique Bucket Name

resource "random_id" "bucket_id" {
  byte_length = 4
}

# S3 Bucket

resource "aws_s3_bucket" "assignment_bucket" {

  bucket = "terraform-assignment-${random_id.bucket_id.hex}"

  tags = {
    Name = "TerraformAssignment"
  }
}

