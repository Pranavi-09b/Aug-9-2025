resource "aws_route_table" "myrt"{
    vpc_id = aws_vpc.mainvp.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }
    tags={
        Name = "myrt"
    }
}