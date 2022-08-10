resource "aws_security_group" "SG_private_subnet_" {
  name        = "MYSQL_security_group"
  description = "MYSQL"
  vpc_id      =  aws_vpc.team1-vpc.id                   

  ingress {
    description = "MYSQL Port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_rds_cluster" "rds_cluster" {
    allocated_storage = 10
    storage_type = "gp2"
    cluster_identifier = "aurora-cluster-demo"
    engine = "aurora-mysql"
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    database_name = "mydb"
    db_subnet_group_name = aws_db_subnet_group.default.name
    master_username = "team1"
    master_password = "team1project"
    vpc_security_group_ids = 
    skip_final_snapshot = true
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
