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

    ingress {
    from_port   = 80
    to_port     = 80
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

#Create rds Cluster with 1 Writer and 3 Reader instances

resource "aws_rds_cluster" "rds_cluster" {
    cluster_identifier = "aurora-cluster-demo"
    engine = var.db-engine
    availability_zones = [var.availability_zone]   #"us-east-1a", "us-east-1c",
    database_name = var.db-name
    db_subnet_group_name = aws_db_subnet_group.default.name
    master_username = var.username
    master_password = var.password
    vpc_security_group_ids = [aws_security_group.SG_private_subnet_.id]
    skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "writer" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "writer"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version
  
}

resource "aws_rds_cluster_instance" "reader1" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "reader1"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version

    depends_on = [
      "aws_rds_cluster_instance.writer",
    ]
  
}

resource "aws_rds_cluster_instance" "reader2" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "reader2"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version

    depends_on = [
      "aws_rds_cluster_instance.writer",
    ]
  
}

resource "aws_rds_cluster_instance" "reader3" {
    apply_immediately = true
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    identifier = "reader3"
    instance_class = "db.t2.small"
    engine = aws_rds_cluster.rds_cluster.engine
    engine_version = aws_rds_cluster.rds_cluster.engine_version

    depends_on = [
      "aws_rds_cluster_instance.writer",
    ]
  
}


#resource "aws_rds_cluster_endpoint" "static" {
 #   cluster_identifier = aws_rds_cluster.rds_cluster.id
 #   cluster_endpoint_identifier = "static"
 #   custom_endpoint_type = "READER"

#    static_members = [
 #       aws_rds_cluster_instance.reader1.id,
 #       aws_rds_cluster_instance.reader2.id,
#        aws_rds_cluster_instance.reader3.id
#    ]
  
#}

#Creating records on Route53



