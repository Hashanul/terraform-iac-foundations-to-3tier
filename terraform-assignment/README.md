### Terraform Assignment: EC2 and S3 Resource Lifecycle

## Objective: Provision AWS resources using Terraform and then destroy them using Terraform lifecycle commands.

# Project Structure

terraform-assignment/
│
├── provider.tf
├── main.tf
├── variables.tf
└── outputs.tf


provider.tf

provider "aws" {
  region = "us-east-1"
}

main.tf

# EC2 Instance

resource "aws_instance" "web_server" {

  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
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


variables.tf

# No variables required for this assignment

outputs.tf

output "instance_id" {
  value = aws_instance.web_server.id
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.assignment_bucket.bucket
}


Required Provider
Terraform automatically downloads the AWS provider.
If you want explicit version control:

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}



Step 1: Initialize Terraform

Run:
terraform init

Expected Output:


Step 2: Review Execution Plan
Run:
terraform plan
Expected:
Plan: 4 to add, 0 to change, 0 to destroy.


Step 3: Create Resources
Run: 
terraform apply
Type:
yes
Expected:
Apply complete! 
Resources: 4 added, 0 changed, 0 destroyed.
Outputs:
bucket_name = "terraform-assignment-0d4d7872"
instance_id = "i-0fc297144fbaff2fb"
public_ip = "54.88.58.72"



Step 4: Verify Resources in AWS Console
EC2 Console
Go to:
AWS Console
→ EC2
→ Instances
Verify:
Instance State = Running
Instance Type = t2.micro
Name = TerraformAssignment


S3 Console
Go to:
AWS Console
→ S3
Verify:
Terraform-assignment-xxxxxxxx
Terraform-assignment-0d4d7872









Step 5: Destroy Resources
Run:
terraform destroy
Type:
yes
Expected:
Destroy complete! 

Resources: 4 destroyed.






Conclusion
This assignment demonstrates Infrastructure as Code (IaC) using Terraform. AWS resources including an EC2 instance and an S3 bucket were successfully provisioned using terraform apply and later removed using terraform destroy, ensuring proper resource lifecycle management and cost optimization.

