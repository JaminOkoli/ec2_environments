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

resource "aws_key_pair" "id_rsa" {
  key_name = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA3ANB5W074m7U1lW5+c/nelwEYybRtVZVpp2v6tzhoECRzIHABx8YcoynvU3YUcRONV6FT9uaIOJ4sIojV9xcNlNPTzy/NEzje8cSOgoH/A3ZnAmpcA1s2ZBTsH8sMsyOS4F5yPIaKicTw7axKCi5PjQeXb5cjjA8VMehxFKggfEqZcNLm4UlLCh64wKlVSmqUeU3d53r5j5UUDSbhHkWSrMHv2i9ifIKgGvW69IjwwNDv1t5ImPENa4qRKYudSFDhify8K7/HFdMTg4HJspxyhDK5EiAqP45FzRBE07iC3kU/e0DaCnMtdM29lMq/a10sDDvHO9cd8SznCL62jIV jamin@Lorenzo"
}