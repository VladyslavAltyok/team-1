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
    availability_zones = ["us-east-1a", "us-east-1c"]# "us-east-1b",]
    database_name = "mydb"
    db_subnet_group_name = aws_db_subnet_group.default.name
    master_username = "team1"
    master_password = "team1project"
    vpc_security_group_ids = [aws_security_group.SG_private_subnet_.id]
    skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "writer" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "test"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}

resource "aws_rds_cluster_instance" "reader1" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "test"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}

resource "aws_rds_cluster_instance" "reader2" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "test"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}

resource "aws_rds_cluster_instance" "reader3" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "test"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}


resource "aws_rds_cluster_endpoint" "static" {
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    cluster_endpoint_identifier = "static"
    custom_endpoint_type = "READER"

    static_members = [
        aws_rds_cluster_instance.reader1.id,
        aws_rds_cluster_instance.reader2.id,
        aws_rds_cluster_instance.reader3.id
    ]
  
}



