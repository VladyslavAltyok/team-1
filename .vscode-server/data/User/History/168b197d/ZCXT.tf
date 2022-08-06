resource "aws_rds_cluster_instance" "writer" {
  apply_immediately  = true
  identifier         = "writer"
  publicly_accessible = true
  cluster_identifier = aws_rds_cluster.wordpress.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.wordpress.engine
  engine_version     = aws_rds_cluster.wordpress.engine_version
}