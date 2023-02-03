provider "aws" {}


resource "aws_vpc" "Drohealth_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "Drohealth_vpc"
  }
}


resource "aws_subnet" "DroHealth_subnet_a" {
  vpc_id                  = aws_vpc.Drohealth_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "DroHealth_subnet_a"
  }
}

resource "aws_subnet" "DroHealth_subnet_b" {
  vpc_id                  = aws_vpc.Drohealth_vpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "DroHealth_subnet_b"
  }
}

resource "aws_subnet" "DroHealth_subnet_c" {
  vpc_id                  = aws_vpc.Drohealth_vpc.id
  availability_zone       = "us-east-1c"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "DroHealth_subnet_c"
  }
}


resource "aws_internet_gateway" "DroHealth_igw" {
  vpc_id = aws_vpc.Drohealth_vpc.id
  tags = {
    "Name" = "DroHealth_igw"
  }
}


resource "aws_route_table" "DroHealth_route_table" {
  vpc_id = aws_vpc.Drohealth_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DroHealth_igw.id
  }
}


resource "aws_route_table_association" "DroHealth_rt_a" {
  subnet_id      = aws_subnet.DroHealth_subnet_a.id
  route_table_id = aws_route_table.DroHealth_route_table.id
}

resource "aws_route_table_association" "DroHealth_rt_b" {
  subnet_id      = aws_subnet.DroHealth_subnet_b.id
  route_table_id = aws_route_table.DroHealth_route_table.id
}

resource "aws_route_table_association" "DroHealth_rt_c" {
  subnet_id      = aws_subnet.DroHealth_subnet_c.id
  route_table_id = aws_route_table.DroHealth_route_table.id
}


resource "aws_security_group" "DroHealth_sg" {
  name        = "DroHealth_sg"
  description = "ssh"
  vpc_id      = aws_vpc.Drohealth_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
