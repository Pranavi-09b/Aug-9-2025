resource "aws_db_instance" "my-db-inst"{
    engine = "mysql"
    engine_version = 
    instance_class = 
    db_name = 
    username = 
    password = 
    parameter_group_name = 
    skip_final_snapshot = true
    availability_zone = "us-east-1b"
    db_subnet_group_name = aws_db_subnet_group.
}