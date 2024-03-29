# Define provider (AWS)
#provider "aws" {
 # region = "us-east-1"
#}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  tags = {
    Name = "FirstPipelineInstance"
  }
}

# RDS Instance
resource "aws_db_instance" "example" {
  identifier            = "myfirstrdsinstance"
  allocated_storage     = 2
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t2.micro"
  username              = "admin"
  password              = "admin123"
  parameter_group_name  = "default.mysql5.7"
  publicly_accessible   = true
  db_subnet_group_name  = "default"

  multi_az              = false  
  storage_type          = "gp2"

  tags = {
    Name = "MyFirstRDSDB"
  }
}
