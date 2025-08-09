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
resource "aws_route_table_association" "my-rt-ass"{
    subnet_id = aws_subnet.mysubnet-public-1
    route_table_id = aws_route_table.myrt.id

}
resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.mainvpc
    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = nat.id
    }
  
}
# rt association for app
resource "aws_route_table_association" "nat-rt-app1" {
  subnet_id = aws_subnet.mysubnet-app-private-1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "nat-rt-app2" {
  subnet_id = aws_subnet.mysubnet-app-private-2.id
  route_table_id = aws_route_table.private-rt.id
}
#rt association for db
resource "aws_route_table_association" "nat-rt-db-1" {
    subnet_id = aws_subnet.mysubnet-private-db-1
    route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "nat-rt-db-1" {
    subnet_id = aws_subnet.mysubnet-db-private-2.id
    route_table_id = aws_route_table.private-rt.id
}
