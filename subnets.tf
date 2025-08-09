resource "aws_subnet" "mysubnet-public-1" {
    vpc_id = aws_vpc.mainvpc.id
    cidr_block = var.public-cidr-1
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags={
        Name = "mysub-public1"
           }
  }
  resource "aws_subnet" "mysubnet-public-2" {
    vpc_id = aws_vpc.mainvpc.id
    cidr_block = var.public-cidr-2
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
    tags={
        Name = "mysub-public2"
           }
  }
  resource "aws_subnet" "mysubnet-app-private-1" {
    vpc_id = aws_vpc.mainvpc.id
    cidr_block = var.private-cidr-1
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags={
        Name = "mysub-private1"
           }
  }
    resource "aws_subnet" "mysubnet-app-private-2" {
    vpc_id = aws_vpc.mainvpc.id
    cidr_block = var.private-cidr-2
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags={
        Name = "mysub-private2"
           }
  }
  resource "aws_subnet" "mysubnet-private-db-1" {
    vpc_id = aws_vpc.mainvpc.id
    cidr_block = var.private-db-cidr-1
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags={
        Name = "mysub-private-db-1"
           }
  }
    resource "aws_subnet" "mysubnet-db-private-2" {
    vpc_id = aws_vpc.mainvpc.id
    cidr_block = var.private-db-cidr-2
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags={
        Name = "mysub-private-db-2"
           }
  }