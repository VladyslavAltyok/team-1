resource "aws_db_subnet_group" "team1-db-subnet-group" {
    name = "database subnets"
    subnet_ids = aws_subnet.private-1.id
    description = "Subnets for DB"
  
}

resource "aws_rds_cluster" "rds_cluster" {
    cluster_identifier = "aurora-cluster-demo"
    engine = "aurora-mysql"
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    database_name = "mydb"
    master_username = "team1"
    master_password = "team1project"
}


