#Asignamos proveedor

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

#Despliegue VPC:

resource "aws_vpc" "ac1_244087_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ac1_244087"
    terraform = "True"
  }
}

#Despliegue SUBNET:

resource "aws_subnet" "ac1_244087_subnet" {
  vpc_id                  = aws_vpc.ac1_244087_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = "ac1_244087"
    terraform = "True"
  }
}

#Despligue INSTANCIA:

resource "aws_instance" "ac1_244087_ubuntu" {
  
  ami           = "ami-0ee02acd56a52998e"
  instance_type = "t2.micro"
  key_name      = "key-pair-ssh"
  subnet_id = aws_subnet.ac1_244087_subnet.id
  tags = {
    Name      = "ac1_244087_ubuntu"
    terraform = "True"
  }
}  