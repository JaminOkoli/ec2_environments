resource "aws_instance" "EHR-frontend_PROD" {
  ami                         = "ami-0778521d914d23bc1"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.DroHealth_subnet_a.id
  vpc_security_group_ids      = ["${aws_security_group.DroHealth_sg.id}"] #"aws_security_group.DroHealth_sg.id" 
  associate_public_ip_address = true
  key_name                    = "DroHealth"
  tags = {
    Name = "EHR-frontend_PROD"
  }
}


resource "aws_instance" "EHR-App_PROD" {
  ami                         = "ami-0778521d914d23bc1"
  instance_type               = "t2.medium"
  subnet_id                   =  aws_subnet.DroHealth_subnet_a.id
  vpc_security_group_ids      = ["${aws_security_group.DroHealth_sg.id}"] #"aws_security_group.DroHealth_sg.id"
  associate_public_ip_address = true
  key_name                    = "DroHealth"
  tags = {
    Name = "EHR-App_PROD"
  }
}


resource "aws_instance" "EHR-frontend_STAGGING" {
  ami                         = "ami-0778521d914d23bc1"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.DroHealth_subnet_b.id
  vpc_security_group_ids      = ["${aws_security_group.DroHealth_sg.id}"] #"aws_security_group.DroHealth_sg.id"
  associate_public_ip_address = true
  key_name                    = "DroHealth"
  tags = {
    Name = "EHR-frontend_STAGGING"
  }
}



resource "aws_instance" "EHR-App_STAGGING" {
  ami                         = "ami-0778521d914d23bc1"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.DroHealth_subnet_b.id
  vpc_security_group_ids      = ["${aws_security_group.DroHealth_sg.id}"] # "aws_security_group.DroHealth_sg.id"
  associate_public_ip_address = true
  key_name                    = "DroHealth"
  tags = {
    Name = "EHR-App_STAGGING"
  }
}


resource "aws_instance" "EHR-frontend_DEV" {
  ami                         = "ami-0778521d914d23bc1"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.DroHealth_subnet_c.id
  vpc_security_group_ids      = ["${aws_security_group.DroHealth_sg.id}"] #"aws_security_group.DroHealth_sg.id"
  associate_public_ip_address = true
  key_name                    = "DroHealth"
  tags = {
    Name = "EHR-frontend_DEV"
  }
}


resource "aws_instance" "EHR-App_DEV" {
  ami                         = "ami-0778521d914d23bc1"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.DroHealth_subnet_c.id
  vpc_security_group_ids      = ["${aws_security_group.DroHealth_sg.id}"]  #"aws_security_group.DroHealth_sg.id"
  associate_public_ip_address = true
  key_name                    = "DroHealth"
  tags = {
    Name = "EHR-App_DEV"
  }
}
