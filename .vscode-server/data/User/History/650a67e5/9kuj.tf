
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.aws]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_rds_cluster" "rds_cluster" {
    cluster_identifier = "aurora-cluster-demo"
    engine = "aurora-mysql"
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    database_name = "mydb"
    master_username = "team1"
    master_password = "team1project"
}

resource "aws_rds_cluster_instance" "test" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "test"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}


resource "aws_rds_cluster_endpoint" "reader1" {
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    cluster_endpoint_identifier = "reader1"
    custom_endpoint_type = "READER"
  
}

resource "aws_rds_cluster_endpoint" "reader2" {
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    cluster_endpoint_identifier = "reader2"
    custom_endpoint_type = "READER"
  
}

resource "aws_rds_cluster_endpoint" "reader3" {
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    endpoint = reader3.altyok.com
    cluster_endpoint_identifier = "reader3"
    custom_endpoint_type = "READER"
  
}
