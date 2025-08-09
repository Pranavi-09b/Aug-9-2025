resource "aws_internet_gateway" "myigw"{
    vpc_id = aws_vpc.mainvpc.id
    tags={
        Name = "myigw"
    }
}