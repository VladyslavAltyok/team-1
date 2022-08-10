

resource "aws_rds_cluster" "rds_cluster" {
    cluster_identifier = "aurora-cluster-demo"
    engine = "aurora-mysql"
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    database_name = "mydb"
    master_username = "team1"
    master_password = "team1project"
}

resource "aws_rds_cluster_instance" "writer" {
    apply_immediately = 
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "writer"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
  
}

