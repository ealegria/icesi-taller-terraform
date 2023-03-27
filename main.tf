# configure provider
provider "aws" {
    region = "us-east-2"
    profile = "aws-practica-2023"
}

resource "aws_s3_bucket" "bucket-s3-basico" {
  bucket = "emav-bucket-s3-basico-20230327"

  tags = {
    Name        = "emav-bucket-s3-basico-20230327"
    Environment = "qa"
  }
}

resource "aws_s3_bucket_acl" "bucket-s3-basico-acl" {
  bucket = aws_s3_bucket.bucket-s3-basico.id
  acl    = "private"
}

resource "aws_instance" "servidor-web" {
  ami = "ami-02f97949d306b597a"
  instance_type="t2.micro"
  tags={
    Name="servidor-web-aws"
  }
}

resource "aws_instance" "servidor-bd" {
  ami = "ami-02f97949d306b597a"
  instance_type="t2.micro"
  tags={
    Name="servidor-bd-aws"
  }
}

resource "aws_instance" "servidor-backend" {
  ami = "ami-00eeedc4036573771"
  instance_type="t2.micro"
  tags={
    Name="servidor-backend-ubuntu"
  }
}

resource "aws_sqs_queue" "queue_basica" {
  name                      = "queue_basica"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "lab"
  }
}