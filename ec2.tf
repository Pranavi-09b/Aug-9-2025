resource "aws_instance" "myinst1"{
    instance_type = "t2.micro"
    ami = 
    subnet_id = aws_subnet.mysubnet-public-1
    key_name= "source_key"
    vpc_security_group_ids = [aws_security_group.web-sg.id]
    user_data = file("myinstall-apache.sh")
    tags={
        Name= web-inst
    }
}
###EC2 instance for app tier
resource "aws_instance" "myinst2-app"{
    instance_type = "t2.micro"
    ami = 
    subnet_id = aws_subnet.mysubnet-app-private-1.id
    key_name= "source_key"
    vpc_security_group_ids = [aws_security_group.app-ssh-sg.id]
        tags={
        Name= app-inst
    }
}