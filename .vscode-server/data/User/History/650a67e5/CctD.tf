

resource "aws_rds_cluster" "rds_cluster" {
    cluster_identifier = "aurora-cluster-demo"
    engine = "aurora-mysql"
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    database_name = "mydb"
    master_username = "team1"
    master_password = "team1project"
}

resource "aws_rds_cluster_instance" "test" {
    apply_immediately = 
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "test"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}

resource "aws_rds_cluster_endpoint" "writer" {
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    cluster_endpoint_identifier = "writer"
    custom_endpoint_type = "WRITER"
  
}
