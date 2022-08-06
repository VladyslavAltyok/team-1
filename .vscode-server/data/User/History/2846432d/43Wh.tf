resource "aws_rds_cluster_instance" "reader" {
  depends_on = [
      aws_rds_cluster.primary,
      aws_rds_cluster_instance.writer
    ]
  apply_immediately  = true
  promotion_tier = count.index
  count              = 3
  identifier         = "reader-db"
  cluster_identifier = aws_rds_cluster.primary.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.primary.engine
  engine_version     = aws_rds_cluster.primary.engine_version
}