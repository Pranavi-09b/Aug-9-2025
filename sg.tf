resource "aws_security_group" "alb-sg"{
    name = "ALB sg"
    vpc_id = aws_vpc.mainvpc.id
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }
    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }
        egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
            }
            tags={
                Name = "ALB SG"
            }
}
## SG FOR APPLICATION
resource "aws_security_group" "app-ssh-sg"{
    vpc_id = aws_vpc.myvpc.id 
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.ssh-local}"]
            }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
            tags={
                Name = "APP SSH SG"
            }
}

######web serevr sg
resource "aws_security_group" "web-sg"{
    vpc_id = aws_vpc.myvpc.id 
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }
    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }
        ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
            tags={
                Name = "web SSH SG"
            }
}

###SG for db
resource "aws_security_group" "db-sg" {
  vpc_id = aws_vpc.myvpc.id 
    ingress{
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${aws_security_group.web-sg.id}"]
            }
     egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
            tags={
                Name = "db SG"
            }  
  
}